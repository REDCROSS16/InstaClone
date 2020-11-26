const Sequelize = require('sequelize');
const sequelize = new Sequelize();

const Tags = sequelize.define('Tags', {
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
