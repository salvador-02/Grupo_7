const fs = require('fs');
const path = require('path');

module.exports = (archivo) => {

   const funciones = {
      path: path.join(__dirname, '..', 'data', archivo + '.json'),
      leerJson: function () {
         const dataJson = fs.readFileSync(this.path, 'utf-8');
         const data = JSON.parse(dataJson);
         return data;
      },
      escribirJson: function (data) {
         data = JSON.stringify(data, null, ' ')

         fs.writeFileSync(this.path, data);
      },
      findById: function (id) {
         const data = this.leerJson();
         const obj = data.find(function(elemento){
            return elemento.id == id;
         })

         return obj;
      },
      findBySomething: function (callback) {
         const data = this.leerJson();
         const dataFiltrada = data.find(callback);
         return dataFiltrada;
      },
      filterBySomething: function(callback){
         const data = this.leerJson();
         const dataFiltrada = data.filter(callback);
         return dataFiltrada;
      },

   }

   return funciones;
}