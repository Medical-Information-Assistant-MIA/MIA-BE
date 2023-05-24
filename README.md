<a name="readme-top"></a>

<div align="center">

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]

</div>

<div align="center">

# Medical Information Assistant(MIA)

</div>
<div align="center">
  <!-- <a href="https://github.com/pantry-wizard/pantry_wizard_be">
    <img src="LOGO_URL_HERE" alt="Logo" width="582" height="404">
  </a> -->
<h3 align="center"></h3>

  <div align="center">
    <!-- ADD APP DESCRIPTION ****************** -->
    <br>
    <p> Medical Information Assistant (MIA) is a service oriented application that allows users to document their personal medical information in a customizable and intuitive way. 
    </p>
    <br />
    <!-- <a href="https://github.com/github_username/repo_name"><strong>Explore the docs »</strong></a> -->
    <!-- <br /> -->
    <!-- <br /> -->
    <!-- <a href="https://github.com/github_username/repo_name">View Demo</a> -->
    <!-- · -->
    <a href="https://github.com/Medical-Information-Assistant-MIA/MIA-BE/issues">Report Bug</a>
    ·
    <a href="https://github.com/Medical-Information-Assistant-MIA/MIA-BE/issues">Request Feature</a>
    ·
    <a href="https://github.com/Medical-Information-Assistant-MIA/MIA-FE">Front End Repo</a>
  </div>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
			
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#installation">Installation</a></li>
        <li><a href="#testing-with-rspec">Testing With RSpec</a></li>
      </ul>
    </li>
    <li><a href="#available-endpoints">Available Endpoints</a></li>
    <li><a href="#goals">Goals</a></li>
    <!-- <li><a href="#usage">Usage</a></li> -->
    <!-- <li><a href="#roadmap">Roadmap</a></li> -->
    <!-- <li><a href="#contributing">Contributing</a></li> -->
    <!-- <li><a href="#license">License</a></li> -->
    <!-- <li><a href="#contact">Contact</a></li> -->
    <!-- <li><a href="#acknowledgments">Acknowledgments</a></li> -->
  </ol>
</details>


<br>

<!-- ABOUT THE PROJECT -->
## About The Project
<br>

<!-- ADD PROJECT DESCRIPTION -->

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## Built With:
### Backend:

[![Ruby]][Ruby-url] **3.1.1**
[![Rails]][Rails-url] **7.0.4**
[![Postgresql]][Postgresql-url] **1.1**
[![GraphQL]][GraphQL-url]
[![GraphiQL]][GraphiQL-url]


### Testing:


[![Faker]][Faker-url]
[![Factory Bot]][Factory Bot-url]
[![RSpec]][RSpec-url]
[![Shoulda-Matchers]][Shoulda-Matchers-url]
[![SimpleCov]][SimpleCov-url]


### Development Tools:

[![Heroku]][Heroku-url]
[![Faraday]][Faraday-url]
[![RuboCop]][RuboCop-url]


<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

<!-- This is a Ruby on Rails application which establishes API endpoints to be called in the <a href="UPDATE LINK"> `MIA-FE` </a> repository. To run the application locally, both front-end and back-end repositories will need to be cloned and set up fully with required gems and environment variables. -->

<br>

### Installation

1. Clone the repo:
   ```bash
   git clone git@github.com:Medical-Information-Assistant-MIA/MIA-BE.git
   ```

2. Install gems:
   ```bash
   bundle install
   ```

3. To establish the database, run:
   ```bash
   rails db:create
   ```

4. Since this is the back-end repository, a database migration is also necessary, run:
   ```bash
   rails db:migrate
   ```

<!-- ADD THIS NEXT STEP ONCE AN EXTERNAL API IS INCORPORATED -->
<!-- 6. Add your API key to the application.yml file
    ```bash
    API_KEY = xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    ```
<br> -->

  Inspect the `/db/schema.rb` and compare to the 'Schema' section below to ensure this migration has been done successfully.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<br>


### Testing with RSpec

Once `MIA-BE` is correctly installed, run tests locally to ensure the repository works as intended.

<br>

  To test the entire RSpec suite, run:
   ```bash
   bundle exec rspec
   ```

<br>

All tests should be passing if the installation was successful. 

If any tests are not passing, please report which tests are not passing <a href="PLEASE UPDATE LINK">Here</a>. We will issue an update/fix as soon as possible.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<br>


## __Available Endpoints__

Current endpoint documentation exists in the Postman Mock Server below.
https://documenter.getpostman.com/view/27373334/2s93kxc6FD

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## __Goals__

MIA was crafted to satisfy the requirements for The Turing Mod 4 **Capstone Project**. 

See the official project requirements [here](https://mod4.turing.edu/projects/capstone/).

<br>

### __Learning Goals__
<ul>
  <li>Use an agile process to turn well defined requirements into deployed and production ready software. </li>
  <li>Gain experience dividing applications into components and domains of responsibilities to facilitate multi-developer teams. Service oriented architecture concepts and patterns are highly encouraged. </li>
  <li>Explore and implement new concepts, patterns, or libraries that have not been explicitly taught while at Turing. </li>
  <li>Practice an advanced, professional git workflow including a Pull Request Review.</li>
  <li>Gain experience using continuous integration tools to build and automate the deployment of features. </li>
  <li>Build applications that execute in development, test, CI, and production environments. </li>
  <li>Add additional querying options for more user friendly trend data representation. </li>
  <li>Utilize caching for optimization. </li>
  <li>Focus on communication between front-end and back-end teams in order to complete and deploy features that have been outlined by the project spec. </li>
</ul>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### __Future Goals__
<ul>
  <li> Add user authentication / authoriazation. </li>
  <li> Utilize caching for optimization.</li>
  <li> Containerize the application via docker.</li>
  <li> Add additional querying options for more user friendly trend data representation.</li>
  <li> Add a microservice that consumes an exerternal API for medication information. </li>
  <li> Deploy the application to another service such as Amazon or Digital Ocean. </li>
</ul>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<br>

## __Database Schema__

<img src=images/schema.png alt="Database Schema">

<br>

## __Back End Team__
<table>
<!-- Update picture links -->
  <!-- <tr>
    <td><img src="https://avatars.githubusercontent.com/u/116330317?s=120&v=4"></td>
    <td><img src="https://avatars.githubusercontent.com/u/88596340?s=120&v=4"></td>
    <td><img src="https://avatars.githubusercontent.com/u/104170346?s=120&v=4"></td>
    <td><img src="https://avatars.githubusercontent.com/u/71752551?s=120&v=4"></td>
    <td><img src="https://avatars.githubusercontent.com/u/117066950?s=120&v=4"></td>
  </tr> -->
  <tr>
    <td>Brad Dunlap</td>
    <td>Chris Crane</td>
    <td>Kara Jones-Hofmann</td>
    <td>Matt Enyeart</td>
    <td>Tori Enyart</td>
  </tr>
  <tr>
    <td>
      <a href="https://github.com/brad-dunlap">GitHub</a><br>
      <a href="https://www.linkedin.com/in/dunlap-brad/">LinkedIn</a> 
    </td>
    <td>
      <a href="https://github.com/GreenGogh47">GitHub</a><br>
      <a href="https://www.linkedin.com/in/chris-crane-16106814/">LinkedIn</a>
    </td>
    <td>
      <a href="https://github.com/KaraJoHo">GitHub</a><br>
   		<a href="https://www.linkedin.com/in/81012911-91208/">LinkedIn</a>
    </td>
    <td>
      <a href="https://github.com/menyeart">GitHub</a><br>
      <a href="https://www.linkedin.com/in/matt-enyeart/">LinkedIn</a>
    </td>
    <td>
      <a href="https://github.com/torienyart">GitHub</a><br>
      <a href="https://www.linkedin.com/in/victoria-enyart-595052155/">LinkedIn</a>
    </td> 
    <td>
      <!-- <a href="https://github.com/tori">GitHub</a><br>
      <a href="https://www.linkedin.com/in/tori/">LinkedIn</a> -->
    </td>
  </tr>
</table>


<!-- PROJECT MANAGER -->
## Project Manager

* Brian Zanti
<!-- Project Mentor -->
<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Project Mentor

* Daniel Starling

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* ["The Best README Template" by Github User othneil](https://github.com/othneildrew/Best-README-Template)


<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- MARKDOWN LINKS & IMAGES -->
[contributors-shield]: https://img.shields.io/github/contributors/Medical-Information-Assistant-MIA/MIA-BE.svg?style=for-the-badge

[contributors-url]: https://github.com/Medical-Information-Assistant-MIA/MIA-BE/graphs/contributors

[forks-shield]: https://img.shields.io/github/forks/pantry-wizard/pantry_wizard_be.svg?style=for-the-badge

[forks-url]: https://github.com/pantry-wizard/pantry_wizard_be/network/members

[stars-shield]: https://img.shields.io/github/stars/pantry-wizard/pantry_wizard_be.svg?style=for-the-badge

[stars-url]: https://github.com/pantry-wizard/pantry_wizard_be/stargazers

[issues-shield]: https://img.shields.io/github/issues/pantry-wizard/pantry_wizard_be.svg?style=for-the-badge

[issues-url]: https://github.com/pantry-wizard/pantry_wizard_be/issues

[license-shield]: https://img.shields.io/github/license/pantry-wizard/pantry_wizard_be.svg?style=for-the-badge

[license-url]: https://github.com/pantry-wizard/pantry_wizard_be/blob/master/LICENSE.txt

[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555

[linkedin-url]: https://linkedin.com/in/linkedin_username

[product-screenshot]: images/screenshot.png

[Ruby]: https://img.shields.io/badge/ruby-000000?style=for-the-badge&logo=ruby&logoColor=red
[Ruby-url]: https://www.ruby-lang.org/en/

[Rails]: https://img.shields.io/badge/rails-red?style=for-the-badge&logo=rubyonrails&logoColor=white&color=red

[Rails-url]: https://rubyonrails.org/

[Postgresql]: https://img.shields.io/badge/postgresql-3386FF?style=for-the-badge&logo=postgresql&logoColor=FFFFFF
[Postgresql-url]: https://www.postgresql.org/

[Heroku]: https://img.shields.io/badge/Heroku-430098?style=for-the-badge&logo=heroku&logoColor=white
[Heroku-url]: https://www.heroku.com/

[Circle-CI]: https://img.shields.io/circleci/build/github/wise-app-team/wise-app-be/main
[Circle-url]: https://app.circleci.com/


[Puma]: https://img.shields.io/badge/-Puma-FFD43B?logo=puma&logoColor=black&style=for-the-badge
[Puma-url]: https://github.com/puma/puma

[bcrypt]: https://img.shields.io/badge/-bcrypt-00599C?logo=gnu-privacy-guard&logoColor=white&style=for-the-badge
[bcrypt-url]: https://github.com/codahale/bcrypt-ruby

[Faraday]: https://img.shields.io/badge/-Faraday-3E3E3E?logo=ruby&logoColor=white&style=for-the-badge
[Faraday-url]: https://github.com/lostisland/faraday

[Figaro]: https://img.shields.io/badge/-Figaro-FF4136?logo=rubygems&logoColor=white&style=for-the-badge
[Figaro-url]: https://github.com/laserlemon/figaro

[GraphQL]: https://img.shields.io/badge/-GraphQL-E10098?logo=graphql&logoColor=white&style=for-the-badge
[GraphQL-url]: https://graphql.org/

[GraphiQL]: https://img.shields.io/badge/-GraphiQL-E10098?logo=graphql&logoColor=white&style=for-the-badge
[GraphiQL-url]: https://github.com/graphql/graphiql


[JSON-Serializer]: https://img.shields.io/badge/-JSON%20API%20Serializer-1E90FF?logo=json&logoColor=white&style=for-the-badge
[JSON-Serializer-url]: https://github.com/jsonapi-serializer/jsonapi-serializer

[Capybara]: https://img.shields.io/badge/-Capybara-FF7F50?logo=rubygems&logoColor=white&style=for-the-badge
[Capybara-url]: https://github.com/teamcapybara/capybara

[RSpec]: https://img.shields.io/badge/-RSpec-FF7F50?logo=rubygems&logoColor=white&style=for-the-badge
[RSpec-url]: https://github.com/rspec/rspec

[Faker]: https://img.shields.io/badge/-Faker-FF69B4?logo=rubygems&logoColor=white&style=for-the-badge
[Faker-url]: https://github.com/faker-ruby/faker

[Shoulda-Matchers]: https://img.shields.io/badge/-Shoulda%20Matchers-5B5B5B?logo=rubygems&logoColor=white&style=for-the-badge
[Shoulda-Matchers-url]: https://github.com/thoughtbot/shoulda-matchers

[Web-mock]: https://img.shields.io/badge/-WebMock-8B0000?logo=rubygems&logoColor=white&style=for-the-badge
[Web-mock-url]: https://github.com/bblimke/webmock

[VCR]: https://img.shields.io/badge/-VCR-2F4F4F?logo=rubygems&logoColor=white&style=for-the-badge
[VCR-url]:  https://github.com/vcr/vcr

[Faker]: https://img.shields.io/badge/-Faker-00BFFF?logo=rubygems&logoColor=white&style=for-the-badge
[Faker-url]: https://github.com/faker-ruby/faker

[Factory Bot]: https://img.shields.io/badge/-FactoryBot-00BFFF?logo=rubygems&logoColor=white&style=for-the-badge
[Factory Bot-url]: https://github.com/thoughtbot/factory_bot

[SimpleCov]: https://img.shields.io/badge/-SimpleCov-00BFFF?logo=rubygems&logoColor=white&style=for-the-badge
[SimpleCov-url]: https://github.com/simplecov-ruby/simplecov

[RuboCop]: https://img.shields.io/badge/-RuboCop-00BFFF?logo=rubygems&logoColor=white&style=for-the-badge
[RuboCop-url]: https://github.com/rubocop/rubocop

[Capybara]: https://img.shields.io/badge/-Capybara-00BFFF?logo=rubygems&logoColor=white&style=for-the-badge
[Capybara-url]: https://github.com/teamcapybara/capybara

[Pry]: https://img.shields.io/badge/-Pry-00BFFF?logo=rubygems&logoColor=white&style=for-the-badge
[Pry-url]: https://github.com/pry/pry


