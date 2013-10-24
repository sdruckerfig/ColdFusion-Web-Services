// JavaScript Document
SubgeniusDB = function () {
    this.db = null;
    dbOpen = function () {
        var db = openDatabase('subgeniusU', '1.0', 'SubGenius University Cached Data',
        5 * 1024 * 1024);

        db.transaction(function (tx) {
            tx.executeSql('CREATE TABLE IF NOT EXISTS applicant (applicantid INTEGER, firstname TEXT, lastname TEXT, email TEXT, hsgrad TEXT, hsgpa NUM, major TEXT)', [], onSuccess, onError);
        });
        return db;
    } // dbopen

    this.importTable = function (tablename, aData) {

        this.db.transaction(function (tx) {
            tx.executeSql('delete from ' + tablename);
        });

        if (aData.length > 0) {

            // build SQL expression   
            var aFields = [],
                aPlaceHolders = [];
            for (var key in aData[0]) {
                aFields.push(key);
                aPlaceHolders.push('?');
            }
            var sql = 'INSERT INTO ' + tablename + ' (' + aFields.join(',') + ') VALUES (' + aPlaceHolders.join(',') + ')';

            // write data to db
            this.db.transaction(function (tx) {
                for (var i = 0; i < aData.length; i++) {
                    var aValues = [];

                    for (var key in aData[i]) {
                        aValues.push(aData[i][key]);
                    }

                    tx.executeSql(sql,
                    aValues,

                    function () {
                        console.log('inserted row')
                    },

                    function () {
                        console.log('failed', arguments)
                    });
                }
            });
        }
    }

    onError = function (tx, e) {
        alert("Error: " + e.message);
    }
    onSuccess = function (e) {
        console.log('dbsuccess', e);
    }

    this.db = dbOpen(); // open the db
    return this;
}