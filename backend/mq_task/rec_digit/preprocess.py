import base64
import numpy as np
import io
from PIL import Image
def preprocess(jpgtxt: str):
        data = base64.b64decode(jpgtxt.split(',')[-1])
        buf = io.BytesIO(data)
        pic = Image.open(buf)
        pic=pic.convert('L')
        pic=pic.resize((28,28))
        M = np.array(pic) #now we have image data in numpy
        threshold, upper, lower=150., 0., 1.0
        M=np.where(M>threshold, upper, lower)
        M=np.array([[M]],dtype=np.float32)
        return M
