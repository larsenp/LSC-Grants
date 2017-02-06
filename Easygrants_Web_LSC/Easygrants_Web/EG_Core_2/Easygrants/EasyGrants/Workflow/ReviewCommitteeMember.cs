using System;
using System.Diagnostics;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Xml;
using Core.DataAccess;
using Core.DataAccess.XMLAccess;
using EasyGrants.DataAccess;


namespace EasyGrants.Workflow {
/*====================================================*/

/// <summary>
/// determines which reviewer gets assigned to an application
/// based on their current workload(AssignedGranteeCount)
/// </summary>
public class cReviewCommitteeMember:cDataObject, IComparable{
/*====================================================*/
	
	private int	mAssignedGranteeCount = 0; 
	
/*====================================================*/

	public int AssignedGranteeCount {
		get {return mAssignedGranteeCount;}
		set {mAssignedGranteeCount=value;}
	}
	
/*====================================================*/

	public cReviewCommitteeMember(DataRow aDataObjectRow, cDataObjectList aDataObjectList):
				base(aDataObjectRow, aDataObjectList) {
		
	} 

/*====================================================*/
//this method compares reviewer load
	public int CompareTo(Object aObj) {
		//compare assignment counts:
		//return < 0 if this is < aObj
		int aVal =0;
		
		if (AssignedGranteeCount < ((cReviewCommitteeMember)aObj).AssignedGranteeCount)
			aVal = -1;
		
		if (AssignedGranteeCount ==((cReviewCommitteeMember)aObj).AssignedGranteeCount)
			aVal = 0;
			
		if (AssignedGranteeCount > ((cReviewCommitteeMember)aObj).AssignedGranteeCount)
			aVal = 1;
			
		return aVal;
	}
	
/*====================================================*/
} //cReviewCommitteeMember
} //EasyGrants.Workflow


