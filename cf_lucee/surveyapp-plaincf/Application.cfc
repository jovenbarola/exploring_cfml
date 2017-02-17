component {

    this.name = "Joven Survey App";

    function onApplicationStart() {
        return true;
    }

    function onSessionStart() {}

    function onRequestStart( string targetPage ) {}

    function onRequest( string targetPage ) {
        include arguments.targetPage;
    }

    function onRequestEnd() {}

    function onSessionEnd( struct SessionScope, struct ApplicationScope ) {}

    function onApplicationEnd( struct ApplicationScope ) {}

    function onError( any Exception, string EventName ) {}

}	