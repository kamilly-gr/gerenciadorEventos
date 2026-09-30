import { Router, Request, Response } from "express";
import prisma from "../prismaClient";
import { error } from "console";
const router = Router();
 
// Cadastrar um eventoo novo
router.post("/", async (req: Request, res: Response) => {
    try {
        const { id, nome, descricao, local, data, palestrante_id } = req.body;
 
        if ( !nome || !descricao || !local || !data || !palestrante_id ) {
            return res.status(400).json({
                error: "Todos os campos são obrigatórios." });
        }
 
        const eventoSalvo = await prisma.evento.create({
            data: {
                id,
                nome,
                descricao,
                local,
                data,
                palestrante_id
            }
        });
    res.status(201).json(eventoSalvo);
 
    } catch (error) {
        console.error("erro ao cadastrar evento:", error);
        res.status(500).json("Erro interno do servidor");
    }
})
 
// Listar todos os eventos
router.get("/", async (req: Request, res: Response) => {
    try {
        const eventos = await prisma.evento.findMany();
        res.status(200).json(eventos);
 
    } catch (error) {
        console.error("Erro ao listar eventos:", error);
        res.status(500).json("Erro interno do servidor");
    }
})
 
// Buscar um evento pelo ID
router.get("/:id", async (req: Request, res: Response) => {
    try {
        const evento  = await prisma.evento.findUnique({
            where: { id: Number(req.params.id)}
        })
   
        if (!evento) {
            return res.status(404).json({ error: "Evento não encontrado."});
        }
        res.json(evento);
    } catch (error) {
        res.status(500).json({ error: "Erro interno do servidor."});
    }
})
 

//Alterar evento com base no ID
router.put("/:id", async (req: Request, res: Response) => {
    try {
        const { nome, descricao, local, data } = req.body;
 
        const evento = await prisma.evento.update({
            where: { id: Number(req.params.id)},
            data: { nome, descricao, local, data, palestrante_id: req.body.palestrante_id }
        })
        res.json(evento);
    } catch (error) {
        res.status(500).json({ error: "Erro interno do servidor."});
    }
})
 

// Deletar evento com base no ID
router.delete("/:id", async (req: Request, res: Response) => {
    try {
        await prisma.evento.delete({
            where: { id: Number(req.params.id)}
        })
        return res.status(204).send();
    } catch (error) {
        res.status(500).json({ error: "Erro interno do servidor."});
    }
})
 
 
 
export default router;