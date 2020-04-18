const db = require('../data/dbConfig');

module.exports = {
  find,
  findById,
  findSteps,
  add,
  update,
  remove,
}

function find() {
  return db('schemes')
}

function findById(id) {
  return db('schemes')
    .where({id})
    .first();
}

function findSteps(id) {
  // SELECT st.id, sc.scheme_name, st.step_number, st.instructions
  // FROM steps as st
  // JOIN schemes as sc
  // ON st.scheme_id = sc.Id
  return db('steps as st')
    .join('schemes as sc', 'sc.id', 'st.scheme_id')
    .select('st.id', 'sc.scheme_name', 'st.step_number', 'st.instructions')
    .where({ scheme_id: id })
}

function add(scheme) {
  return db('schemes')
    .insert(scheme)
}

function update(changes, id) {
  return db('schemes')
    .where({id})
    .update(changes)
}

function remove(id) {
  return db('schemes')
    .where({id})
    .del()
}