const res = require('response')
const database = require('aws')

exports.handler = async (event) => {
    try {
        const tableName = event.pathParameters.table_name
        const data = await database(`DROP TABLE ${tableName};`)
        return res.send(data)
    } catch (error) {
        return res.send(error)
    }
}