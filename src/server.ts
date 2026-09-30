import express from 'express';
import palestranteRoutes from '../src/routes/palestrantesRoutes';
import eventoRoutes from '../src/routes/eventosRoutes';

const app = express()

app.use(express.json())
app.use("/api/palestrantes", palestranteRoutes)

app.use("/api/eventos", eventoRoutes)

app.listen(3000, () => {
  console.log('Servidor está rodando na porta 3000')
})