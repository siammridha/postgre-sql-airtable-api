const res = require('response')
const database = require('aws')

exports.handler = async (event) => {
    try {
        const tableName = event.pathParameters.table_name
        const sql = `CREATE TABLE ${tableName}(); INSERT INTO tables(id,name) VALUES(uuid_generate_v4(),'${tableName}');`
        const data = await database(sql)
        return res.send(data)
    } catch (error) {
        return res.send(error)
    }
}


// CREATE TABLE IF NOT EXISTS users(
//     email VARCHAR(225) PRIMARY KEY,
//     first_name VARCHAR(100) NOT NULL,
//     last_name VARCHAR(100) NOT NULL,
//     position VARCHAR REFERENCES positions(name) ON DELETE CASCADE
// );

// const res = require('response')
// const database = require('aws')
// const { createTable } = require('object-to-SQL')

// exports.handler = async (event) => {
//     try {
//         const body = JSON.parse(event.body)
//         const sql = createTable(body)
//         console.log(sql)
//         const data = await database(sql)
//         return res.send(data)
//     } catch (error) {
//         return res.send(error)
//     }
// }
