const Sequelize = require('sequelize');
const sequelize = new Sequelize();

const UsersProfiles = sequelize.define('UsersProfiles', {
    'id' : {
        'type': Sequelize.INTEGER,
        'autoIncrement': true,
        'primaryKey': true,
        'allowNull': false
    },
    'name' : {
        'type': Sequelize.STRING,
        'allowNull': false
    },
    'lastName' : {
        'type': Sequelize.STRING,
        'allowNull': false
    },
    'nickname' : {
        'type': Sequelize.STRING,
        'allowNull': false
    },
    'age' : {
        'type': Sequelize.INTEGER,
        'allowNull': false
    },
    'photo' : {
        'type': Sequelize.STRING,
        'allowNull': false
    },
    'ip' : {
        'type': Sequelize.STRING,
        'allowNull': false
    },
    'email' : {
        'type': Sequelize.STRING,
        'allowNull': false
    },
});

console.log(UsersProfiles === sequelize.models.UsersProfiles);