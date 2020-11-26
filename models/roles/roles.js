const Sequelize = require('sequelize');
const sequelize = new Sequelize();

const Roles = sequelize.define('Roles', {
    'id' : {
        'type' : Sequelize.INTEGER,
        'autoIncrement' : true,
        'primarykey' : true,
        'allowNull' : false
    },
    'name' : {
        'type' : Sequelize.STRING,
        'allowNull' : false
    }

});