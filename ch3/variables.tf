variable "vm_map" {
    type = map(object({
        name = string
	tag = string
    }))
    default = {
        "webserver1" = {
	    name = "webserver1"
	    tag = "webserver"
	}
        "webserver2" = {
	    name = "webserver2"
	    tag = "webserver"
	}
        "database1" = {
	    name = "database1"
	    tag = "database"
	}
        "database2" = {
	    name = "database2"
	    tag = "database"
	}
    }
}
