import time

import uvicorn
from fastapi import FastAPI
import gradio as gr
from starlette.staticfiles import StaticFiles
from starlette.requests import Request
from starlette.responses import Response

CUSTOM_PATH = "/gradio"

app = FastAPI()
app.mount("/static", StaticFiles(directory="static"), name="static")

@app.get("/")
def read_main():
    return {"message": "This is your main app"}

@app.middleware("http")
async def db_session_middleware(request: Request, call_next):
    print('------------middleware--------------')
    start_time = time.time()
    response = await call_next(request)
    process_time = time.time() - start_time
    response.headers["X-Process-Time"] = str(process_time)
    return response


io = gr.Interface(lambda x: "Hello, " + x + "!", "textbox", "textbox")
app = gr.mount_gradio_app(app, io, path=CUSTOM_PATH)


# Run this from the terminal as you would normally start a FastAPI app: `uvicorn run:app`
# and navigate to http://localhost:8000/gradio in your browser.

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=5000, log_level="info")
