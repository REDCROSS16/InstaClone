const Sequelize = require('sequelize');

const Posts = {
    'id' : {
        'type' : Sequelize.INTEGER,
        'autoIncrement' : true,
        'primarykey' : true,
        'allowNull' : false
    },
    'user_id' : {
        'type' : Sequelize.INTEGER,
        'allowNull' : false
    },
    'post_image' : {
        'type' : Sequelize.STRING,
        'allowNull' : false
    },
    'content' : {
        'type' : Sequelize.STRING,
        'allowNull' : false
    },
    'create_at' : {
        'type' : Sequelize.STRING,
    },
    'delete_at' : {
        'type' : Sequelize.STRING,
    },
    'update_at' : {
        'type' : Sequelize.STRING,
    },
};