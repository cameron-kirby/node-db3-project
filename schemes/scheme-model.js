const knex = require('knex');

const db = require("../data/db-config.js")

module.exports = {
    find,
    findById,
    findSteps,
    add,
    update,
    remove
};

function find() {
    return db('schemes');
}

function findById(id) {
    return db('schemes')
        .where({ id })
        .first();
}

function findSteps(id) {
    return db("schemes")
        .join("steps", "steps.scheme_id", "schemes.id")
        .select("steps.id", "schemes.scheme_name", "steps.step_number", "steps.instructions")
        .where("steps.scheme_id", "=", Number(id))
        .orderBy("steps.step_number");
}

function add(scheme) {
    return db('schemes')
        .insert(scheme)
        .then(ids => {
            return getById(ids[0]);
        });
}

function update(changes, id) {
    return db('schemes')
        .where({ id })
        .update(changes)
        .then(() => {
            return getById(id);
        });
}

function remove(id) {
    return db('schemes')
        .where('id', id)
        .del();
}