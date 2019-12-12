const db = require('knex')(require('../knexfile').development);
module.exports = {
  find,
  findById,
  findSteps,
  add,
  update,
  remove,
  db
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
  return db('steps')
    .select('steps.id', 'scheme_name', 'step_number', 'instructions')
    .join('schemes', 'steps.scheme_id', '=', 'schemes.id')
    .where({ scheme_id: id })
    .orderBy('step_number');
}
function add(scheme) {
  return db('schemes').insert(scheme).then(id => {
    return db('schemes').where({id: id[0]}).first()
  })
}
function update(changes, id) {
  return db('schemes').where({ id }).update(changes).then(()=>{
    return db('schemes').where({id}).first()
  });
}
function remove(id) {
  return db('schemes').where({id}).first().then(s => {
    if(s){
      return db('schemes').where({id}).del().then(()=>{return s})
    }else{
      return s
    }
  })
}
