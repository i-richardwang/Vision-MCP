from starlette.applications import Starlette
from starlette.routing import Mount
from vision_mcp.server import mcp

app = Starlette(routes=[Mount("/", app=mcp.sse_app())])
