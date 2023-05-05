import pizzaServices from './services/pizza-services.js';
import express from 'express';
import sql from 'mssql'
const app = express();
const port = 3000;
app.listen(port, ()=>{
    console.log('Listening on port: ',port)

});
app.get('/pizza' , async (req, res) =>{
    const pizza = await pizzaServices.getAll();
    res.status(200).send(pizza)
});

app.get('/pizza/:Id' , async (req, res) =>{
    const pizza = await pizzaServices.getById(req.params.Id)
    res.status(200).send(pizza)
});
app.use(express.json());
app.post('/pizza', async(req, res)=>{
    try{
        await pizzaServices.insert(req.body)
        res.status(200).json ({message: 'pizza creada con exito'});
    }    catch (error){ 
        console.error(error);
        res.status(500).json({error: 'No se pudo crear la pizza'});
    }
});
app.put('/pizza', async(req, res)=>{
    try{
        console.log(req);
        await pizzaServices.update(req.body);
        res.status(200).json ({message: 'Cambios realizados con exito'});
    } catch(error){
        console.error(error);
        res.status(500).json ({message : 'No se pudieron realizar los cambios'})
    }

});
app.delete('/pizza/:Id', async(req,res)=>{
    try{
        await pizzaServices.deleteById(req.params.Id)
        res.status(200).json({message : 'Se borro la pizza con exito'})
    }catch(error){
        console.error(error);
        res.status(500).json({message : 'No se pudo borrar la pizza'})
    }
});
