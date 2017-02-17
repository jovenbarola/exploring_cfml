<!--- 
Name: questions.cfc

Description:
    table component for CRUD operation

History
  date               author     remark
  Feb 16, 2017       joven      init file

--->
<cfcomponent hint="Questions component" output="no">
	<cfset dsn="jovendb_dsn">
	<cffunction name="ChkAllQuestions" returnType="query" output="no" hint="check all questions">	
	
		<cfquery name="getAllQuestions" dataSource="#dsn#">
			SELECT *
			FROM questions
            ORDER BY id ASC
		</cfquery>

		<cfreturn getAllQuestions>
	</cffunction>
	<cffunction name="ChkQuestion" returnType="query" output="no" hint="check specific question">	
		<cfargument name="id" required="false" hint="">
	
		<cfquery name="getQuestion" dataSource="#dsn#">
			SELECT *
			FROM questions
			WHERE id !=0
			<cfif isdefined("arguments.id")>
				AND id = <cfqueryparam CFSQLType="CF_SQL_VARCHAR" value="#arguments.id#">
			</cfif>
		</cfquery>

		<cfreturn getQuestion>
	</cffunction>
    <cffunction name="AddQuestion" returnType="any" output="no" hint="add question info">	
		<cfargument name="question_text" required="true" hint="">
        <cfargument name="question_addedby" required="true" hint="">
         
		<cfquery name="AddQuestionData" dataSource="#dsn#">
			INSERT INTO questions (question, added_by)
            VALUES (<cfqueryparam CFSQLType="cf_sql_varchar" value="#arguments.question_text#">,
                   <cfqueryparam CFSQLType="cf_sql_varchar" value="#arguments.question_addedby#">)
		</cfquery>

		
		<cfset AddQuestion1 = "1">
		
		<cfreturn AddQuestion1>
	</cffunction>
    <cffunction name="DeleteQuestion" returnType="any" output="no" hint="delete question info">	
		<cfargument name="question_id" required="true" hint="">
            
		<cfquery name="DeleteQuestionData" dataSource="#dsn#">
			DELETE FROM questions
			WHERE id = <cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#arguments.question_id#">
		</cfquery>
		<cfset DeleteQuestion1 = "1">
		
		<cfreturn DeleteQuestion1>
	</cffunction>
</cfcomponent>