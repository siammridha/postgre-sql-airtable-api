const AWS = require('aws-sdk')
AWS.config.update({ region: "us-east-2" })

const RDS = new AWS.RDSDataService()

module.exports = (sql) => {
    return RDS.executeStatement({
        secretArn: 'arn:aws:secretsmanager:us-east-2:025077378556:secret:rds-db-credentials/cluster-FRFLOJVH2EKVT27YT4LLGZCQNM/masudalam43-2KwiCP',
        resourceArn: 'arn:aws:rds:us-east-2:025077378556:cluster:database-2',
        sql: sql,
        database: 'ExampleCompany'
    }).promise()
}
