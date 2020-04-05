package dev.oz;

import java.util.HashMap;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

@Path("health")
public class Health {
    @GET
    @Path("ready")
    @Produces(MediaType.APPLICATION_JSON)
    public Response health() {
        final var map = new HashMap<String, String>();
        map.put("ready", "ok");
        return Response.ok(map).build();
    }
}