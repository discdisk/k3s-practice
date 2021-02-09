from fastapi import FastAPI
from ..mq_tack.mq_task import rec_digit
import sys
version = f"{sys.version_info.major}.{sys.version_info.minor}"

app = FastAPI()

@app.get("/")
async def read_root():
    message = f"Hello world! From FastAPI running on Uvicorn with Gunicorn. Using Python {version}"
    return {"message": message}