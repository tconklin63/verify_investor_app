### Basic Information
This app deployed and running at http://verify-investor-upload.herokuapp.com. When first visiting the site you will need to create a user, after which you will be immediately signed in. The default Devise settings do not require you to sign in via an email link.

On your user page, you can upload and download files. I created a user and uploaded some files already. You can see them by logging in with user@exmaple.com/password1

### Implementation Details
* User sign up and authentication is done via the devise gem.
* To get around Heroku's temporary file storage, file data is stored in the database in the uploaded_files table. This table contains a filename field and a binary field to store the actual data. (This is something I had previous solved for my persional projects running on Heroku)
* Each user will only see their own files.
* I used Twitter Bootstrap to quickly get a basic UI up and running.
* PDFs appear in a new browser tab when clicking on the filename, which then allows downloading.
* I tested only with the latest version of Chrome.
* Models are annotated via the annotate gem.

### What's Missing
I ran out of time before being able to complete the following. I don't think they were that difficult, but they are things I have not done before and would have required more time-consuming debugging to get them working properly.
* There are no API endpoints to upload and download independent of the UI. I have experience developing APIs with SOAP, REST, and GraphQL using both XML and JSON, but I have not previously implemented file upload via an API.
* I did not use ActiveJob to make the downloads asynchronous. I have not used ActiveJob before, but I have used Sidekiq for asynchronous processing. I think I could have gotten this working with more time.
* I do not exclude any file types, but I only tested with PDFs.
* Because of time constraints, I did not add unit tests, which distresses me greatly.
