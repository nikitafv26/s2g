using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace S2G.WebAPI.Infrastructure
{
    public class RequestResult
    {
        public string Message { get; set; }
        public RequestStatus Status { get; set; }
        public Object Data { get; set; }
    }

    public enum RequestStatus
    {
        Unknown = 0,
        Ok = 200,
        NotModified = 304,
        BadRequest = 400,
        Unauthorized = 401,
        Forbidden = 403,
        NotFound = 404,
        InternalServerError = 500,
        ServiceUnavailable = 503,
        Canceled = 1001,
        InvalidRequest = 1002,
        SerializationError = 1003,
        DatabaseError = 1100,
        FileAccessError = 2001,
        ModelStateError = 2002,
        IdentityError = 2003,
        DuplicateUserName = 2004
    }
}
