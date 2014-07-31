module.exports = (grunt) ->
  pkg = grunt.file.readJSON 'package.json'
  fs = require('fs')
  grunt.initConfig
    pkg: pkg

    clean: fs.readFileSync('.gitignore').toString().split('\n')
              .filter((line) -> line && line.match(/^assets/))

    jshint:
      files: ['assets/js/*.js', '!**/*.min.js']

    uglify:
      options:
        banner: '/*! <%= pkg.name %> - v<%= pkg.version %> - <%= grunt.template.today("yyyy-mm-dd") %> */'
        sourceMap: true
      todosjs:
        files:
          'assets/js/todos.min.js':
            'assets/js/todos.js'

    compass:
      dist:
        options:
          sassDir: 'sass'
          cssDir: 'assets/css'
          outputStyle: 'compressed'

    watch:
      static:
        files: 'assets/index.html'
      js:
        files: '<%= jshint.files %>'
        tasks: ['jshint', 'uglify']
      sass:
        files: 'sass/*'
        tasks: ['compass']
      options:
        livereload: true

    bower:
      install:
        options:
          targetDir: 'assets/components'
          layout: 'byComponent'
          install: true
          verbose: false
          cleanTargetDir: true
          cleanBowerDir: false

    connect:
      options:
        hostname: '0.0.0.0'
        base: 'assets'

  for task of pkg.devDependencies when task.substring(0, 6) is 'grunt-'
    grunt.loadNpmTasks task

  grunt.registerTask 'build', ['bower:install', 'compass', 'jshint', 'uglify']
  grunt.registerTask 'default', ['build', 'connect', 'watch']
