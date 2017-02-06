The folder "Build 4.3a" which contains this document introduces a new naming standard to the project folder. 
Within the DBScripts folder, a folder named with an "a" after the build name indicates that the scripts in that
folder do not need to be executed as part of a build. They have been applied to the production database outside
the build process because they do not directly affect the application's functionality. This is often true of views
and stored procedures developed for reporting purposes.

Peter Larsen 2/10/2009