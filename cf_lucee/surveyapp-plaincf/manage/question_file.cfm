    <cfinclude template="../layout/head.cfm" />
    
    <cfif isdefined('url.action')>
        <cfif #url.action# EQ "del">
            <!--- invoke delete operation --->
             <cfinvoke component="cfc/questions" method="DeleteQuestion" question_id="#url.u_id#" />
            
             <cflocation url="question_file.cfm" addtoken="false" />
             <cfexit/>
        </cfif>
    </cfif>

    <cfif isdefined('form.action')>
        <cfif #form.action# EQ "yo!men">

            <!--- invoke add operation --->
            <cfinvoke component="cfc/questions" method="AddQuestion" returnVariable="tere" question_text="#form.tquestion#" question_addedby="#form.tadded_by#" />
<!---            <cfdump var="#tere#" abort>--->
            <cflocation url="question_file.cfm" addtoken="false" />
            <cfexit/>
        </cfif>
    </cfif>

    <div class="w3-container">
        <div class="w3-panel">
            <h1>Manage Questions</h1>

            <form action="" method="POST">
            <input type="hidden" name="action" value="yo!men" />
            <table>
                <tr>
                    <td>question: </td>
                    <td><input type="text" name="tquestion"  class="w3-input" required /></td>
                </tr>
                <tr>
                    <td>added by: </td>
                    <td><input type="text" name="tadded_by" class="w3-input" required /></td>
                </tr>
                <tr>
                    <td></td>
                    <td><button type="submit" class="w3-btn">Add</button></td>
                </tr>
            </table>
            </form>
            <!--- invoke seelct operation --->
            <cfinvoke component="cfc/questions" method="ChkAllQuestions" returnVariable="getAllQuestions" />
            
            <cfoutput>
            <table class="w3-table-all">
                <thead>
                  <tr class="w3-light-grey">
                    <th>Question</th>
                    <th>Added by</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                <cfif getAllQuestions.recordcount GTE "1">
                    <cfloop query = "#getAllQuestions#">
                        <tr>
                            <td>#getAllQuestions.question#</td>
                            <td>#getAllQuestions.added_by#</td>
                            <td><a href="question_file.cfm?action=del&u_id=#getAllQuestions.id#" onclick="return confirm('Are you sure want to delete?');">Delete</a></td>
                        </tr>
                    </cfloop>
                <cfelse>
                        <tr>
                            <td colspan="3">No Current Record.</td>
                        </tr>
                </cfif>
                </tbody>
            </table>
            </cfoutput>
            

        </div>
        
    </div>

    <cfinclude template="../layout/footer.cfm" />