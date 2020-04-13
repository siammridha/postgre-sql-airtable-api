const res = require('response')
const database = require('aws')

exports.handler = async (event) => {
    try {
        const tableName = JSON.parse(event.body)
        const data = await database(`DROP TABLE ${tableName};`)
        return res.send(data)
    } catch (error) {
        return res.send(error)
    }
}