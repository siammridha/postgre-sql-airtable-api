const createTable = (table) => {
    let sql = `CREATE TABLE ${table.name}(`
    table.columns.forEach((column, i) => {
        sql = `${sql} ${column.name}`
        if (column.type) {
            sql = `${sql} ${column.type}`
        } if (column.type_length) {
            sql = `${sql}(${column.type_length})`
        } if (column.key) {
            sql = `${sql} ${column.key}`
        } if (column.null) {
            sql = `${sql} ${column.null}`
        }
        // if (column.default) {
        //     sql = `${sql} DEFAULT ${column.default}`
        // }
        if (i + 1 !== table.columns.length) {
            sql = `${sql},`
        }
    })
    return `${sql});`
}

const alterTable = (table) => {
    let sql = `ALTER TABLE ${table.name}`
    table.update.columns.forEach((column, i) => {
        sql = `${sql} ALTER COLUMN ${column.name}`
        if (column.type) {
            sql = `${sql} TYPE ${column.type}`
        } if (column.type_length) {
            sql = `${sql}(${column.type_length})`
        } if (column.key) {
            sql = `${sql} ${column.key}`
        } if (column.null) {
            sql = `${sql} ${column.null}`
        }
        // if (column.default) {
        //     sql = `${sql} DEFAULT ${column.default}`
        // }
        if (i + 1 !== table.columns.length) {
            sql = `${sql};`
        }
    })
    return sql
}

module.exports = { createTable, alterTable }