# Generated on 2014-01-11 using generator-angular 0.7.1
"use strict"

# # Globbing
# for performance reasons we're only matching one level down:
# 'test/spec/{,*/}*.js'
# use this if you want to recursively match all subfolders:
# 'test/spec/**/*.js'
module.exports = (grunt) ->

  # Load grunt tasks automatically
  require("load-grunt-tasks") grunt

  # Time how long tasks take. Can help when optimizing build times
  require("time-grunt") grunt

  # Define the configuration for all the tasks
  grunt.initConfig

    # Project settings
    yeoman:

      # configurable paths
      app: require("./bower.json").appPath
      dist: "./public"


    # Watches files for changes and runs tasks based on the changed files
    watch:
      coffee:
        files: ["<%= yeoman.app %>/scripts/{,*/}*.{coffee,litcoffee,coffee.md}"]
        tasks: ["newer:coffee:dist"]

      coffeeTest:
        files: ["test/spec/{,*/}*.{coffee,litcoffee,coffee.md}"]
        tasks: ["newer:coffee:test", "karma"]

      sass:
        files: ["<%= yeoman.app %>/styles/{,*/}*.scss"]
        tasks: ["sass:dist", "autoprefixer"]

      gruntfile:
        files: ["Gruntfile.js"]

      livereload:
        options:
          livereload: "<%= connect.options.livereload %>"

        files: ["<%= yeoman.app %>/{,*/}*.html", ".tmp/styles/{,*/}*.css", ".tmp/scripts/{,*/}*.js", "<%= yeoman.app %>/images/{,*/}*.{png,jpg,jpeg,gif,webp,svg}"]


    # The actual grunt server settings
    connect:
      options:
        port: 9000

        # Change this to '0.0.0.0' to access the server from outside.
        hostname: "localhost"
        livereload: 35729

      livereload:
        options:
          open: true
          base: [".tmp", "<%= yeoman.app %>"]

      test:
        options:
          port: 9001
          base: [".tmp", "test", "<%= yeoman.app %>"]

      dist:
        options:
          base: "<%= yeoman.dist %>"


    # Make sure code styles are up to par and there are no obvious mistakes
    jshint:
      options:
        jshintrc: ".jshintrc"
        reporter: require("jshint-stylish")

      all: ["Gruntfile.js"]


    # Empties folders to start fresh
    clean:
      dist:
        options:
          force: true

        files: [
          dot: true
          src: [".tmp", "<%= yeoman.dist %>/*", "!<%= yeoman.dist %>/.git*"]
        ]

      server: ".tmp"


    # Add vendor prefixed styles
    autoprefixer:
      options:
        browsers: ["last 1 version"]

      dist:
        files: [
          expand: true
          cwd: ".tmp/styles/"
          src: "{,*/}*.css"
          dest: ".tmp/styles/"
        ]


    # Automatically inject Bower components into the app
    "bower-install":
      app:
        html: "<%= yeoman.app %>/index.html"
        ignorePath: "<%= yeoman.app %>/"


    # Compiles CoffeeScript to JavaScript
    coffee:
      options:
        sourceMap: true
        sourceRoot: ""

      dist:
        files: [
          expand: true
          cwd: "<%= yeoman.app %>/scripts"
          src: "{,*/}*.coffee"
          dest: ".tmp/scripts"
          ext: ".js"
        ]

      test:
        files: [
          expand: true
          cwd: "test/spec"
          src: "{,*/}*.coffee"
          dest: ".tmp/spec"
          ext: ".js"
        ]

    sass:
      dist:
        files:
          ".tmp/styles/main.css": "angular/styles/main.scss"

        options:
          includePaths: ["angular/bower_components"]


    # Renames files for browser caching purposes
    rev:
      dist:
        files:
          src: ["<%= yeoman.dist %>/scripts/{,*/}*.js", "<%= yeoman.dist %>/styles/{,*/}*.css", "<%= yeoman.dist %>/images/{,*/}*.{png,jpg,jpeg,gif,webp,svg}", "<%= yeoman.dist %>/styles/fonts/*"]


    # Reads HTML for usemin blocks to enable smart builds that automatically
    # concat, minify and revision files. Creates configurations in memory so
    # additional tasks can operate on them
    useminPrepare:
      html: "<%= yeoman.app %>/index.html"
      options:
        dest: "<%= yeoman.dist %>"


    # Performs rewrites based on rev and the useminPrepare configuration
    usemin:
      html: ["<%= yeoman.dist %>/{,*/}*.html"]
      css: ["<%= yeoman.dist %>/styles/{,*/}*.css"]
      options:
        assetsDirs: ["<%= yeoman.dist %>"]

    bower:
      install: {}


    #just run 'grunt bower:install' and you'll see files from your Bower packages in lib directory

    # The following *-min tasks produce minified files in the dist folder
    imagemin:
      dist:
        files: [
          expand: true
          cwd: "<%= yeoman.app %>/images"
          src: "{,*/}*.{png,jpg,jpeg,gif}"
          dest: "<%= yeoman.dist %>/images"
        ]

    svgmin:
      dist:
        files: [
          expand: true
          cwd: "<%= yeoman.app %>/images"
          src: "{,*/}*.svg"
          dest: "<%= yeoman.dist %>/images"
        ]

    htmlmin:
      dist:
        options:
          collapseWhitespace: true
          collapseBooleanAttributes: true
          removeCommentsFromCDATA: true
          removeOptionalTags: true

        files: [
          expand: true
          cwd: "<%= yeoman.dist %>"
          src: ["*.html", "views/{,*/}*.html"]
          dest: "<%= yeoman.dist %>"
        ]


    # Allow the use of non-minsafe AngularJS files. Automatically makes it
    # minsafe compatible so Uglify does not destroy the ng references
    ngmin:
      dist:
        files: [
          expand: true
          cwd: ".tmp/concat/scripts"
          src: "*.js"
          dest: ".tmp/concat/scripts"
        ]


    # Replace Google CDN references
    cdnify:
      dist:
        html: ["<%= yeoman.dist %>/*.html"]


    # Copies remaining files to places other tasks can use
    copy:
      dist:
        files: [
          expand: true
          dot: true
          cwd: "<%= yeoman.app %>"
          dest: "<%= yeoman.dist %>"
          src: ["*.{ico,png,txt}", ".htaccess", "*.html", "views/{,*/}*.html", "bower_components/**/*", "images/{,*/}*.{webp}", "fonts/*"]
        ,
          expand: true
          cwd: ".tmp/images"
          dest: "<%= yeoman.dist %>/images"
          src: ["generated/*"]
        ]

      styles:
        expand: true
        cwd: "<%= yeoman.app %>/styles"
        dest: ".tmp/styles/"
        src: "{,*/}*.css"


    # Run some tasks in parallel to speed up the build process
    concurrent:
      server: ["coffee:dist", "sass:dist"]
      test: ["coffee", "sass:dist"]
      dist: ["coffee", "sass:dist", "imagemin", "svgmin"]


    # By default, your `index.html`'s <!-- Usemin block --> will take care of
    # minification. These next options are pre-configured if you do not wish
    # to use the Usemin blocks.
    # cssmin: {
    #   dist: {
    #     files: {
    #       '<%= yeoman.dist %>/styles/main.css': [
    #         '.tmp/styles/{,*/}*.css',
    #         '<%= yeoman.app %>/styles/{,*/}*.css'
    #       ]
    #     }
    #   }
    # },
    # uglify: {
    #   dist: {
    #     files: {
    #       '<%= yeoman.dist %>/scripts/scripts.js': [
    #         '<%= yeoman.dist %>/scripts/scripts.js'
    #       ]
    #     }
    #   }
    # },
    # concat: {
    #   dist: {}
    # },

    # Test settings
    karma:
      unit:
        configFile: "karma.conf.js"
        singleRun: true

  grunt.registerTask "serve", (target) ->
    if target is "dist"
      return grunt.task.run ["build", "connect:dist:keepalive"]

    grunt.task.run [
      "clean:server",
      "bower:install",
      "bower-install",
      "concurrent:server",
      "autoprefixer",
      "connect:livereload",
      "watch"
    ]

  grunt.registerTask "server", ->
    grunt.log.warn "The `server` task has been deprecated. Use `grunt serve` to start a server."
    grunt.task.run ["serve"]

  grunt.registerTask "test", [
    "clean:server",
    "concurrent:test",
    "autoprefixer",
    "connect:test",
    "karma"
  ]

  grunt.registerTask "build", [
    "clean:dist",
    "bower:install",
    "bower-install",
    "useminPrepare",
    "concurrent:dist",
    "autoprefixer",
    "concat",
    "ngmin",
    "copy:dist",
    "cdnify",
    "cssmin",
    "uglify",
    "rev",
    "usemin",
    "htmlmin"
  ]

  grunt.registerTask "default", [
    "newer:jshint",
    "test",
    "build"
  ]

  grunt.registerTask "heroku:production", "build"
