import config from "../dbconfig.js";
import sql from 'mssql';

class pizzaServices{
    static getAll = async() => {
        let returnPizza= null;
        try{
            let pool =await sql.connect(config);
            let results = await pool.request()
                                .query('SELECT * FROM Pizza');
            console.log(results);
             returnPizza = results.recordset[0];                              
        } 
        catch(error){console.log(error)}
        return returnPizza;
    }

    static getById = async(Id) => {
        let returnPizza= null;
        try{
            let pool =await sql.connect(config);
            let results = await pool.request()
                                .input('pId', sql.Int, Id)
                                .query('SELECT * FROM Pizza WHERE Id = @pId');
             returnPizza = results.recordsets[0][0];                              
        } 
        catch(error){console.log(error)}
        return returnPizza;
    }

    static deleteById = async(Id) => {
        let returnPizza= null;
        try{
            let pool =await sql.connect(config);
            let results = await pool.request()
                                .input('pId', sql.Int, Id)
                                .query('DELETE FROM Pizza WHERE Id = @pId');
             returnPizza =results.recordsets[0][0];                              
        } 
        catch(error){console.log(error)}
        return returnPizza;
    }
    
    static update = async(Pizza) => {
        let returnPizza = null;
        const {Nombre, LibreGluten, Importe, Descripcion} = Pizza
        console.log(Pizza);
        try{
            let pool =await sql.connect(config);
            let results = await pool.request()
                                .input('pId', sql.Int, Pizza.Id)
                                .input('nombre', sql.NVarChar, Pizza.Nombre)
                                .input('libreGluten', sql.Bit, Pizza.LibreGluten)
                                .input('importe', sql.Int, Pizza.Importe)
                                .input('descripcion', sql.NVarChar, Pizza.Descripcion)
                                .query('UPDATE Pizza SET Nombre = @nombre, LibreGluten = @libreGluten, Importe = @importe, Descripcion = @descripcion WHERE Id = @pId');
             returnPizza =results.rowsaffected;                              
        } 
        catch(error){console.log(error)}
        return returnPizza;
    }
    static insert = async(Pizza) => {
        let returnPizza = null;
        console.log(Pizza);
        const {Nombre, LibreGluten, Importe, Descripcion} = Pizza
        try{
            let pool =await sql.connect(config);
            let results = await pool.request()
                                .input('nombre', sql.NVarChar, Pizza.Nombre)
                                .input('libreGluten', sql.Bit, Pizza.LibreGluten)
                                .input('importe', sql.Int, Pizza.Importe)
                                .input('descripcion', sql.NVarChar, Pizza.Descripcion)
                                .query('INSERT INTO Pizza(Nombre,LibreGluten,Importe,Descripcion) VALUES(@nombre,@libreGluten,@importe,@descripcion)');
             returnPizza =results.rowsaffected;                              
        } 
        catch(error){console.log(error)}
        return returnPizza;
    }

}
export default pizzaServices;