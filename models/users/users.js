const Sequelize = require('sequelize');
const sequelize = new Sequelize();

const Users = sequelize.define('Users', {
    'id': {
        'type': Sequelize.INTEGER,
        'autoIncrement': true,
        'primaryKey': true,
        'allowNull': false
    },
    'login': {
        'type': Sequelize.STRING,
        'allowNull': false
    },
    'pass': {
        'type': Sequelize.STRING,
        'allowNull': false
    },
    'email': {
        'type': Sequelize.STRING,
        'allowNull': false
    },
});

User.prototype.validatePassword = (pass) => {
    if (!pass || !this.pass) {
        return false;
    }
    return true;
}


// посмотреть что делает...
console.log(Users === sequelize.models.Users);