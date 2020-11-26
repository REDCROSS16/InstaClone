const Sequelize = require('sequelize');
const sequelize = new Sequelize();

const Likes = sequelize.define('Likes', {
    'id' : {
        'type' : Sequelize.INTEGER,
        'autoIncrement' : true,
        'primaryKey' : true,
        'allowNull' : false
    },
    'user_id' : {
        'type' : Sequelize.INTEGER,
        'autoIncrement' : true,
        'allowNull' : false
    },
    'post_id' : {
        'type' : Sequelize.INTEGER,
        'autoIncrement' : true,
        'allowNull' : false
    },
    'delete_at' : {
        'type' : Sequelize.INTEGER,
        'autoIncrement' : true
    }
});