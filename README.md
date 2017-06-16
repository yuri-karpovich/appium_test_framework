# Overview

This is a demo test framework for mobile applications testing. It's based on Ruby + Appium + Cucumber.

# Requirements
 1. At least one **Android Virtual Device** should be created.
 2. **Android Emulator** should be installed and **started**
 2. **Appium** server should be installed and **started**
 3. **Ruby** should be installed
 4. **Bundler** gem should be installed

# Installation 
 1. Download source code to your machine
 2. Run `bundle install` to install required gems
 3. You are ready to go!
 
# How to run tests
 1. Set required environment variables. See **Environment variables** section below.
 2. Run `bundle exec  cucumber features/*` in the project folder
 
> Make sure you have an APK file by you `ENV['APP_PATH']` path. I've put a sample file for testing to `sample_apk/SeriesGuide-free-debug.apk`.
 But DO NOT store *.apk files in a VCS (:

## Environment variables
`ENV['DEVICE']` - name of an Android Virtual Device which will be used.
`ENV['APP_PATH']` - absolute path to the application file.

# Results
 
By default you can see tests results right in the STDOUT. But there are 2 more options:
- HTML report: if you run `bundle exec cucumber -p html` command then you will get a pretty HTML report by the path `log/cucumber.html`.
- Log: if you want output not in the STDOUT but in the file, you need to run `bundle exec cucumber -p log`. Then you will find log file by the path `log/cucumber.log`. 
       
# Troubleshooting
**Q: Test is stuck in the beginning. Why?**

A: Check your emulator screen. Likely there is an Android system confirmation window displayed. Click **** button and re-run your tests again.
It may happens only while the first run on a device.  

**Q: I want to run tests on server machine without GUI. Is it possible?**

A: Yes. But you need to configure an environment properly. It's out of this manual.