# Budget App 🤍

![Microverse](https://img.shields.io/badge/Microverse-blueviolet) ![app](https://img.shields.io/badge/Myapp-blue)

> A mobile web application where you can manage your budget 🤍
> With a list of transactions associated with a category, so that you can see how much money you spent and on what.

## Demo photo: 

Mobile version       |  Categories Mobile    | Desktop Version
-------------------- | ----------------------|-----------------
![login](https://user-images.githubusercontent.com/54015740/144716828-cf5db97f-0554-4532-aae1-48a4b0947485.png)|![demo](https://user-images.githubusercontent.com/54015740/144716658-7f3fa2e8-c439-4c38-bccb-aa86cc910764.png)|![desktop](https://user-images.githubusercontent.com/54015740/144716903-8c69b721-43d0-42f5-a466-c0c34533a86f.png)


## Demo Link: 

[live Demo](https://budgetapps.herokuapp.com/) 

[Video Demo](https://www.loom.com/share/1555f689a73d4af38f3cd9970d3f5ae0)

## Built With 🤍

- Ruby on Rails
- PostgreSQL

## Getting Started 🤍

To get a local copy up and running follow these simple example steps.

### Prerequisites 🤍

- [Ruby](https://www.ruby-lang.org/en/) 🤍
- [Rails](https://gorails.com/) 🤍

### Setup 🤍

- Make sure you have Ruby on Rails set up properly on your computer
- Clone or download this repo on your machine
- Enter project directory

### Install 🤍

```sh
bundle install
```

### Database 🤍

```sh
# Create user
sudo -u postgres createuser budgeapp -s

# Create the database
rails db:create

## Apply migration
rails db:migrate

# Load the schema
rails db:schema:load
```

### Run 🤍

```sh
rails s
```

### Test 🤍

```sh
rspec
```

## Author 🤍

👤 **Sheyla Pozo** 

- Github:[sheylaPozo](https://github.com/sheylaPozo)
- Linkedin: [Sheyla Pozo](https://www.linkedin.com/in/sheypozo/)

## 🤝 Contributing:

Contributions, issues, and feature requests are welcome! 🤍

Feel free to check the [issues page](https://github.com/sheylaPozo/budgetapp/issues).

## 🤍 Show your support:

Give a `⭐️` if you like this project!

## 🤍 Acknowledgments:

Hat tip to anyone whose code was used:
- Microverse's guidelines
- Original design idea by Gregoire Vella on [Behance](https://www.behance.net/gregoirevella).
- Inspiration

## 📝 License 🤍:

This project is [MIT](./LICENSE.md) licensed.
