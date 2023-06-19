### Versions
Ruby 3.2.2
Rails 7.0.5

### Preparation
Build images by running
```sh
docker compose build
```

Seed database with sample users by running
```
bin/db_setup
```
Rename file `.env.example` to `.env` and fill with valid `OMDB_API`

If you are not provded with OMDb token, you can generate your own by visiting [OMDb site]([url](https://www.omdbapi.com/apikey.aspx))

### Tests & Console
Tests can be run by
```
bin/tests
```

For console access type
```
bin/console
```

### Running server
Start server by
```
bin/server
```
After initialization you can find the app at port 3000
```
http://localhost:3000
```

To sign-in a user you need to choose one from selector in the top right corner

<img width="307" alt="image" src="https://github.com/twiduch/movies/assets/1155575/312454a5-517e-4811-b72f-a616ffc8f244">


## App
The app allows to create lists of movies for a user and keep them in separate groups.

User can:
* CRUD different groups in which the movies will be stored.
* search for a movie from [OMDB API]([url](https://www.omdbapi.com/)) service.
* select active group
* add movie to active group
* look at the movies inside the group

After opening main page, choose the user and go to Dashboard by clicking in the nav bar

<img width="307" alt="image" src="https://github.com/twiduch/movies/assets/1155575/312454a5-517e-4811-b72f-a616ffc8f244">

From `/dashboard` you can perform movie search

<img width="1198" alt="image" src="https://github.com/twiduch/movies/assets/1155575/8a0ae6f2-6391-471c-a165-6661e3f913dc">


### Authentication
There is no sign-up system implemented.

To mock different users there is selector in top right corner of nav bar.

<img width="106" alt="image" src="https://github.com/twiduch/movies/assets/1155575/3299329b-433b-4de6-9149-be51c429b474">

You can switch between existing users. No password is necessary. Session is switched and not protected.

### Groups JSON view
You can see groups data in JSON format:
* /groups.json
* /groups/:id.json

### Updates
Some of the updates are performed by Turbo streams and Stimulus connection for better UX.

This should be extended to other components.

### Further work
The app needs to be polished in all areas like security, ui, logging, monitoring, errors handling, tests, etc., to be ready for production.

This is initial version of what can be built.
