using System;

namespace Core.Exceptions
{
    /// <summary>
    /// User-defined exception to handle attempts to inject SQL statements into URLs
    /// </summary>
    public class cSQLInjectionException : ApplicationException
    {
        /*====================================================*/

        public cSQLInjectionException() { }

        /*-----------------------------------------------------*/

        public cSQLInjectionException(string aMessage)
            : base(aMessage) { }

        /*-----------------------------------------------------*/

        public cSQLInjectionException(string aMessage, Exception aInnerException)
            : base(aMessage, aInnerException) { }

        /*====================================================*/

    } //public class cSQLInjectionException

} //namespace Core.Exception

