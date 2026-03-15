const express = require("express")
const client = require("prom-client")

const app = express()

client.collectDefaultMetrics()

const requestCounter = new client.Counter({
  name: "http_requests_total",
  help: "Total number of requests"
})

app.get("/", (req,res) => {
  requestCounter.inc()
  res.send("SRE reliability lab running")
})

app.get("/health", (req,res)=>{
  res.status(200).send("OK")
})

app.get("/metrics", async (req,res)=>{
  res.set("Content-Type",client.register.contentType)
  res.end(await client.register.metrics())
})

app.listen(3000)