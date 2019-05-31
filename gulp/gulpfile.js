var package = require('./package.json');
var argv = require('yargs').argv;
var gulpif = require('gulp-if');
var gulp = require('gulp');
var debug = require('gulp-debug');
var copy = require('gulp-copy');
var sass = require('gulp-sass');
var sourcemaps = require('gulp-sourcemaps');
var header = require('gulp-header');
var autoprefixer = require('gulp-autoprefixer');
var cleancss = require('gulp-clean-css');
var uglify = require('gulp-uglify');
var jshint = require('gulp-jshint');
var concat = require('gulp-concat');
var imagemin = require('gulp-imagemin');
var changed = require('gulp-changed');
// var htmlreplace = require('gulp-html-replace');
// var htmlmin = require('gulp-htmlmin');
var del = require('del');
var rename = require('gulp-rename');
var ext_replace = require('gulp-ext-replace');
var exec = require('child_process').exec;
// var replace = require('gulp-replace');
var sequence = require('run-sequence');
var zip = require('gulp-zip');
var browserSync = require('browser-sync');

var banner = [
    '/*!\n' +
    ' * Theme <%= package.name %>\n' +
    ' * Description: <%= package.description %>\n' +
    ' * URL: <%= package.demo %>\n' +
    ' * @author <%= package.author.name %>\n' +
    ' * @version <%= package.version %>\n' +
    ' * Copyright ' + new Date().getFullYear() + '. <%= package.license %> licensed.\n' +
    ' */',
    '\n'
].join('');

var config = {
    sass_in: package.config.assets_src + '/sass/**/*.scss',
    sass_out: package.config.assets_src + '/css/',

    css_in: [
        package.config.assets_src + '/css/**/*.css',
        '!' + package.config.assets_src + '/css/vendor/**/*.css',
        '!' + package.config.assets_src + '/css/opt/**/*.css'
    ],
    css_out: package.config.assets_dist + '/css/',
    css_out_name: 'style.css',
    css_replace_out: 'css/style.css',

    css_vendor_out: package.config.assets_dist + '/css/',
    css_vendor_out_name: 'vendor.css',

    css_opt_in: package.config.assets_src + '/css/opt/**/*.css',
    css_opt_out: package.config.assets_dist + '/css/opt/',

    js_in: [
        package.config.assets_src + '/js/**/*.js',
        '!' + package.config.assets_src + '/js/vendor/**/*.js',
        '!' + package.config.assets_src + '/js/opt/**/*.js'
    ],
    js_out: package.config.assets_dist + '/js/',
    js_out_name: 'script.js',
    js_replace_out: 'js/script.js',

    js_vendor_out: package.config.assets_dist + '/js/',

    js_vendor_header_out_name: 'vendor-header.js',
    js_vendor_header_replace_out: 'js/vendor-header.js',

    js_vendor_footer_out_name: 'vendor-footer.js',
    js_vendor_footer_replace_out: 'js/vendor-footer.js',

    js_opt_out: package.config.assets_dist + '/js/opt/',

    fonts_in: package.config.assets_src + '/fonts/**',
    fonts_out: package.config.assets_dist + '/fonts/',

    imgin: package.config.assets_src + '/img/**/*.{jpg,jpeg,png,gif,svg}',
    imgout: package.config.assets_dist + '/img/'
};

var swallowError = function swallowError(error) {
    console.log(error.toString());
    this.emit('end');
};

gulp.task('sass', function () {
    return gulp.src(config.sass_in)
        .pipe(gulpif(package.config.debug, debug()))
        .pipe(sourcemaps.init())
        .pipe(sass().on('error', swallowError))
        .pipe(autoprefixer('last 4 version'))
        .pipe(sourcemaps.write())
        .pipe(gulp.dest(config.sass_out))
        .pipe(gulpif(package.config.debug, debug()));
    // .pipe(browserSync.stream());
});

gulp.task('css', function () {
    return gulp.src(config.css_in)
        .pipe(gulpif(package.config.debug, debug()))
        .on('error', swallowError)
        .pipe(concat(config.css_out_name))
        .pipe(cleancss())
        .pipe(sourcemaps.write('.'))
        .pipe(header(banner, { package: package }))
        .pipe(rename({ suffix: '.min' }))
        .pipe(gulp.dest(config.css_out))
        .pipe(gulpif(package.config.debug, debug()));
});

gulp.task('css-vendor', function () {
    return gulp.src(package.config.css_deps)
        .pipe(gulpif(package.config.debug, debug())).on('error', swallowError)
        .pipe(concat(config.css_vendor_out_name))
        .pipe(sourcemaps.write('.'))
        .pipe(rename({ suffix: '.min' }))
        .pipe(gulp.dest(config.css_out))
        .pipe(gulpif(package.config.debug, debug()));
});

gulp.task('css-vendor-maps', function () {
    return gulp.src(package.config.css_deps_maps)
        .pipe(gulpif(package.config.debug, debug()))
        .pipe(gulp.dest(config.css_out))
        .pipe(gulpif(package.config.debug, debug()));
});

gulp.task('css-opt', function () {
    return gulp.src(config.css_opt_in)
        .pipe(gulpif(package.config.debug, debug()))
        .on('error', swallowError)
        .pipe(rename({ suffix: '.min' }))
        .pipe(gulp.dest(config.css_opt_out))
        .pipe(gulpif(package.config.debug, debug()));
});

gulp.task('js', function () {
    return gulp.src(config.js_in)
        .pipe(gulpif(package.config.debug, debug()))
        .pipe(gulpif(package.config.jshint, jshint('.jshintrc')))
        .pipe(gulpif(package.config.jshint, jshint.reporter('default')))
        .pipe(concat(config.js_out_name))
        .pipe(uglify())
        .pipe(header(banner, { package: package }))
        .pipe(rename({ suffix: '.min' }))
        .pipe(gulp.dest(config.js_out))
        .pipe(gulpif(package.config.debug, debug()));
});

gulp.task('js-vendor-header', function () {
    return gulp.src(package.config.js_deps_header)
        .pipe(gulpif(package.config.debug, debug()))
        .pipe(concat(config.js_vendor_header_out_name))
        .pipe(rename({ suffix: '.min' }))
        .pipe(gulp.dest(config.js_vendor_out))
        .pipe(gulpif(package.config.debug, debug()));
});

gulp.task('js-vendor-header-maps', function () {
    return gulp.src(package.config.js_deps_header_maps)
        .pipe(gulpif(package.config.debug, debug()))
        .pipe(gulp.dest(config.js_vendor_out))
        .pipe(gulpif(package.config.debug, debug()));
});

gulp.task('js-vendor-footer', function () {
    return gulp.src(package.config.js_deps_footer)
        .pipe(gulpif(package.config.debug, debug()))
        .pipe(concat(config.js_vendor_footer_out_name))
        .pipe(rename({ suffix: '.min' }))
        .pipe(gulp.dest(config.js_vendor_out))
        .pipe(gulpif(package.config.debug, debug()));
});

gulp.task('js-vendor-footer-maps', function () {
    return gulp.src(package.config.js_deps_footer_maps)
        .pipe(gulpif(package.config.debug, debug()))
        .pipe(gulp.dest(config.js_vendor_out))
        .pipe(gulpif(package.config.debug, debug()));
});

gulp.task('js-opt', function () {
    return gulp.src(package.config.js_deps_opt)
        .pipe(gulpif(package.config.debug, debug()))
        .pipe(gulpif(package.config.production, uglify()))
        .pipe(ext_replace('.js', '.min.js'))
        .pipe(rename({ suffix: '.min' }))
        .pipe(gulp.dest(config.js_opt_out))
        .pipe(gulpif(package.config.debug, debug()));
});

gulp.task('js-opt-maps', function () {
    return gulp.src(package.config.js_deps_opt_maps)
        .pipe(gulpif(package.config.debug, debug()))
        .pipe(gulp.dest(config.js_opt_out))
        .pipe(gulpif(package.config.debug, debug()));
});

gulp.task('fonts', function () {
    return gulp.src(package.config.fonts_deps)
        .pipe(gulpif(package.config.debug, debug()))
        .pipe(gulp.dest(config.fonts_out))
        .pipe(gulpif(package.config.debug, debug()));
});

gulp.task('img', function () {
    return gulp.src(config.imgin)
        .pipe(gulpif(package.config.debug, debug()))
        .pipe(changed(config.imgout))
        .pipe(imagemin())
        .pipe(gulp.dest(config.imgout))
        .pipe(gulpif(package.config.debug, debug()));
});

gulp.task('clean', function () {
    return del(package.config.assets_dist);
});

gulp.task('zip', ['sass', 'js'], function () {
    var targetDir = 'dist/';
    var themeName = require('./package.json').name;
    var filename = themeName + '.zip';

    return gulp.src([
        '**',
        '!node_modules', '!node_modules/**',
        '!dist', '!dist/**'
    ])
        .pipe(zip(filename))
        .pipe(gulp.dest(targetDir));
});

gulp.task('build', function () {
    sequence('clean', [
        'sass',
        'css-vendor',
        'css-vendor-maps',
        'css',
        'css-opt',
        'js-vendor-header',
        'js-vendor-header-maps',
        'js-vendor-footer',
        'js-vendor-footer-maps',
        'js',
        'js-opt',
        'fonts',
        'img',
        'reload'
    ]);
});

gulp.task('reload', function () {
    browserSync.reload();
});

gulp.task('serve', ['sass'], function () {
    browserSync({
        proxy: "http://localhost:2300/"
    });
    gulp.watch([config.htmlin, config.js_in], ['reload']);
    gulp.watch(config.scss_in, ['sass']);
});

gulp.task('default', [
    'sass',
    'css-vendor',
    'css-vendor-maps',
    'css',
    'css-vendor',
    'css-opt',
    'js-vendor-header',
    'js-vendor-header-maps',
    'js-vendor-footer',
    'js-vendor-footer-maps',
    'js',
    'js-opt',
    'js-opt-maps',
    'fonts',
    'img',
    'reload'
], function () {

    browserSync({
        proxy: "http://localhost:2300/"
    });

    gulp.watch("assets/src/scss/**/*.scss", ['sass']);
    gulp.watch("assets/src/css/**/*.css", [
        'css-vendor',
        'css-vendor-maps',
        'css'
    ]);
    gulp.watch("assets/src/js/**/*.js", [
        'js-vendor-header',
        'js-vendor-header-maps',
        'js-vendor-footer',
        'js-vendor-footer-maps',
        'js-opt',
        'js-opt-maps',
        'js'
    ]);
    gulp.watch("assets/src/fonts/**/*", ['fonts']);
    gulp.watch("assets/src/img/**/*.{jpg,jpeg,png,gif}", ['img']);
    gulp.watch("package.json", [
        'js-vendor-header',
        'js-vendor-header-maps',
        'js-vendor-footer',
        'js-vendor-footer-maps',
        'js-opt',
        'js-opt-maps',
        'js',
        'reload'
    ]);
    gulp.watch("*.hbs", ['reload']);
    gulp.watch("partial/*.hbs", ['reload']);
});
