var gulp = require('gulp'),
    sass = require('gulp-ruby-sass'),
    autoprefixer = require('gulp-autoprefixer'),
    minifycss = require('gulp-minify-css'),
    jshint = require('gulp-jshint'),
    uglify = require('gulp-uglify'),
    imagemin = require('gulp-imagemin'),
    rename = require('gulp-rename'),
    concat = require('gulp-concat'),
    notify = require('gulp-notify'),
    cache = require('gulp-cache'),
    livereload = require('gulp-livereload'),
    del = require('del');

gulp.task('styles', function () {
    return sass('src/styles/main.scss', {style: 'expanded'})
        .pipe(autoprefixer('last 2 version'))
        .pipe(gulp.dest('src/main/resources/static/css'))
        .pipe(rename({suffix: '.min'}))
        .pipe(minifycss())
        .pipe(gulp.dest('src/main/resources/static/css'))
        .pipe(notify({message: 'Styles task complete'}));
});

gulp.task('scripts', function () {
    return gulp.src('src/scripts/**/*.js')
        .pipe(jshint('.jshintrc'))
        .pipe(jshint.reporter('default'))
        .pipe(concat('main.js'))
        .pipe(gulp.dest('src/main/resources/static/js'))
        .pipe(rename({suffix: '.min'}))
        .pipe(uglify())
        .pipe(gulp.dest('src/main/resources/static/js'))
        .pipe(notify({message: 'Scripts task complete'}));
});

gulp.task('images', function () {
    return gulp.src('src/images/**/*')
        .pipe(imagemin({optimizationLevel: 3, progressive: true, interlaced: true}))
        .pipe(gulp.dest('src/main/resources/static/images/images'))
        .pipe(notify({message: 'Images task complete'}));
});

gulp.task('clean', function () {
    return del(['src/main/resources/static/css', 'src/main/resources/static/js', 'src/main/resources/static/images/images']);
});

gulp.task('default', ['clean'], function () {
    gulp.start('styles', 'scripts', 'images');
});

gulp.task('watch', function () {

    // Watch .scss files
    gulp.watch('src/styles/**/*.scss', ['styles']);

    //     // Watch .js files
    gulp.watch('src/scripts/**/*.js', ['scripts']);

    //         // Watch image files
    gulp.watch('src/images/**/*', ['images']);

});
