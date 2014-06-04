using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace eLawyer.Models
{
    public class CourtCaseModels
    {

        #region Cases
        /// <summary>
        /// Enroll New Case
        /// </summary>
        /// <param name="newCase"></param>
        /// <returns></returns>
        public static int EnrollNewCase(Cases newCase)
        {
            using (eLawyerEntities ele = new eLawyerEntities())
            {
                Cases oldCase = ele.Cases.FirstOrDefault(cs => newCase.CaseNumber.Equals(cs.CaseNumber, StringComparison.OrdinalIgnoreCase));
                if (oldCase == null)
                {
                    newCase.CreatedDate = DateTime.Now.Date;
                    newCase.LastUpdated = DateTime.Now.Date;
                    newCase.IsActive = true; // intially a case will be assumed as a active case.
                    ele.AddToCases(newCase);
                    return ele.SaveChanges();
                }
                return 0;
            }
        }

        public static int UpdateCaseinfo(Cases currentCase)
        {
            using (eLawyerEntities ele = new eLawyerEntities())
            {
                Cases oldCase = ele.Cases.FirstOrDefault(cs => currentCase.CaseNumber.Equals(cs.CaseNumber, StringComparison.OrdinalIgnoreCase));
                if (oldCase != null)
                {
                    oldCase.CourtName = currentCase.CourtName;
                    oldCase.EnrollmentDate = currentCase.EnrollmentDate;
                    oldCase.FirstHearingDate = currentCase.FirstHearingDate;
                    oldCase.FirstParty = currentCase.FirstParty;
                    oldCase.FirstPartyAddress = currentCase.FirstPartyAddress;
                    oldCase.FirstPartyPhone = currentCase.FirstPartyPhone;
                    oldCase.SecondParty = currentCase.SecondParty;
                    oldCase.SecondPartyAddress = currentCase.SecondPartyAddress;
                    oldCase.SecondPartyPhone = currentCase.SecondPartyPhone;
                    oldCase.Status = currentCase.Status;
                    oldCase.NextDate = currentCase.NextDate;
                    oldCase.LastUpdated = currentCase.LastUpdated;
                    oldCase.IsFromFirstParty = currentCase.IsFromFirstParty;
                    oldCase.IsFromSecondParty = currentCase.IsFromSecondParty;
                    oldCase.MyPartyName = currentCase.MyPartyName;
                    oldCase.MyPartyPhone = currentCase.MyPartyPhone;
                    oldCase.Description = currentCase.Description;
                    return ele.SaveChanges();
                }
                return 0;
            }
        }

        public static Cases GetCaseDetailsById(int id)
        {
            using (eLawyerEntities ele = new eLawyerEntities())
            {
                return ele.Cases.FirstOrDefault(cs => cs.ID == id);
            }
        }

        public static vw_CaseLists GetCaseDetailsByCaseId(int caseId)
        {
            using (eLawyerEntities ele = new eLawyerEntities())
            {
                return ele.vw_CaseLists.FirstOrDefault(cs => cs.ID == caseId);
            }
        }

        public static vw_CaseLists GetCaseDetailsByCaseNumber(string caseNumber)
        {
            using (eLawyerEntities ele = new eLawyerEntities())
            {
                return ele.vw_CaseLists.FirstOrDefault(cs => caseNumber.Equals(cs.CaseNumber, StringComparison.OrdinalIgnoreCase));
            }
        }

        public static List<vw_CaseLists> GetSearchedCaseList(string searchText)
        {
            using (eLawyerEntities ele = new eLawyerEntities())
            {
                List<vw_CaseLists> sCases = new List<vw_CaseLists>();
                sCases = (from cs in ele.vw_CaseLists
                          where cs.IsDeleted == null &&
                          cs.CaseNumber.StartsWith(searchText) ||
                          cs.FirstParty.StartsWith(searchText) ||
                          cs.SecondParty.StartsWith(searchText) ||
                          cs.CourtName.StartsWith(searchText) ||
                          cs.JudgeName.StartsWith(searchText) ||
                          cs.Status.StartsWith(searchText) ||
                          cs.FirstPartyPhone.StartsWith(searchText) ||
                          cs.SecondPartyPhone.StartsWith(searchText) ||
                          cs.MyPartyPhone.StartsWith(searchText) ||
                          cs.FirstPartyAddress.Contains(searchText) ||
                          cs.SecondPartyAddress.Contains(searchText) ||
                          cs.MyPartyName.StartsWith(searchText)
                          select cs).ToList();
                return sCases;
            }
        }

        /// <summary>
        /// returns cases list for given client, otherwise returns all case list
        /// </summary>
        /// <param name="clientId"></param>
        /// <returns></returns>
        public static List<vw_CaseLists> GetCaseList(int? clientId)
        {
            using (eLawyerEntities ele = new eLawyerEntities())
            {
                if (clientId == null)
                    return ele.vw_CaseLists.Where(cs => cs.IsDeleted == null).ToList();
                else
                    return ele.vw_CaseLists.Where(cs => cs.IsDeleted == null && cs.ClientId == (int)clientId).ToList();
            }
        }

        /// <summary>
        /// returns cases list for given client and date range, otherwise returns all case list for date range
        /// </summary>
        /// <param name="fromdate"></param>
        /// <param name="toDate"></param>
        /// <param name="clientId"></param>
        /// <returns></returns>
        public static List<vw_CaseLists> GetCaseList(DateTime fromdate, DateTime toDate, int? clientId)
        {
            using (eLawyerEntities ele = new eLawyerEntities())
            {

                if (clientId == null)
                    return ele.vw_CaseLists.Where(cs => cs.IsDeleted == null && cs.EnrollmentDate.Value >= fromdate.Date && cs.EnrollmentDate.Value <= toDate.Date).ToList();
                else
                    return ele.vw_CaseLists.Where(cs => cs.IsDeleted == null && cs.ClientId == (int)clientId && cs.EnrollmentDate.Value >= fromdate.Date && cs.EnrollmentDate.Value <= toDate.Date).ToList();
            }
        }

        public static List<vw_CaseLists> GetCaseAlerts(DateTime fromdate, DateTime toDate, int? clientId)
        {
            using (eLawyerEntities ele = new eLawyerEntities())
            {

                if (clientId == null)
                    return ele.vw_CaseLists.Where(cs => cs.IsDeleted == null && cs.NextDate.Value >= fromdate.Date && cs.NextDate.Value <= toDate.Date).ToList();
                else
                    return ele.vw_CaseLists.Where(cs => cs.IsDeleted == null && cs.ClientId == (int)clientId && cs.NextDate.Value >= fromdate.Date && cs.NextDate.Value <= toDate.Date).ToList();
            }
        }

        public static int DeleteCaseById(int id)
        {
            using (eLawyerEntities ele = new eLawyerEntities())
            {
                Cases oldCase = ele.Cases.FirstOrDefault(cs => cs.ID == id);
                if (oldCase != null)
                {
                    oldCase.IsDeleted = true;
                    return ele.SaveChanges();
                }
                return 0;
            }
        }




        #endregion //Cases

        #region CaseHearings
        public static int DeleteCaseHearingById(int id)
        {
            using (eLawyerEntities ele = new eLawyerEntities())
            {
                CaseHearings oldCaseHearing = ele.CaseHearings.FirstOrDefault(cs => cs.ID == id);
                if (oldCaseHearing != null)
                {
                    oldCaseHearing.IsDeleted = true;
                    return ele.SaveChanges();
                }
                return 0;
            }
        }
        public static CaseHearings GetCaseHearingById(int id)
        {
            using (eLawyerEntities ele = new eLawyerEntities())
            {
                return ele.CaseHearings.FirstOrDefault(ch => ch.ID == id && ch.IsDeleted == null);
            }
        }

        public static List<CaseHearings> GetCaseHearingListByCaseId(int id)
        {
            using (eLawyerEntities ele = new eLawyerEntities())
            {
                return ele.CaseHearings.Where(ch => ch.CaseId == id && ch.IsDeleted == null).ToList();
            }
        }
        public static int CreateNewCaseHearing(CaseHearings newHearing)
        {
            try
            {
                using (eLawyerEntities ele = new eLawyerEntities())
                {
                    ele.AddToCaseHearings(newHearing);
                    return ele.SaveChanges();
                }
            }
            catch
            {
                return 0;
            }
        }

        public static int UpdateCaseHearing(CaseHearings caseHearing)
        {
            using (eLawyerEntities ele = new eLawyerEntities())
            {
                CaseHearings oldStudent = ele.CaseHearings.FirstOrDefault(st => st.ID == caseHearing.ID);

                if (oldStudent == null)
                    return -1;//Student record not found.


                var updatedStudents = ele.ApplyCurrentValues(oldStudent.GetType().Name, caseHearing);
                return ele.SaveChanges();
            }
        }
        #endregion//CaseHearings

        #region CasePayments
        public static int AddPayment(Payments newPayments)
        {
            using (eLawyerEntities ele = new eLawyerEntities())
            {
                if (newPayments != null)
                {
                    ele.AddToPayments(newPayments);
                    return ele.SaveChanges();
                }
                return 0;
            }
        }

        public static int EditPayment(Payments payment)
        {
            using (eLawyerEntities ele = new eLawyerEntities())
            {
                Payments oldPayment = ele.Payments.FirstOrDefault(p => p.Id == payment.Id);
                if (oldPayment != null)
                {
                    //oldPayment.ClientId=payment.ClientId
                    oldPayment.CaseId = payment.CaseId;
                    oldPayment.PaidTo = payment.PaidTo;
                    oldPayment.ExpenseHeadId = payment.ExpenseHeadId;
                    oldPayment.PaymentModeId = payment.PaymentModeId;
                    oldPayment.Date = payment.Date;
                    oldPayment.CHQ_DATE = payment.CHQ_DATE;
                    oldPayment.CHQ_NO = payment.CHQ_NO;
                    oldPayment.Amounts = payment.Amounts;
                    oldPayment.BANK = payment.BANK;
                    oldPayment.Narration = payment.Narration;
                    oldPayment.Remarks = payment.Remarks;

                    return ele.SaveChanges();
                }
                return 0;
            }

        }
        #endregion //CasePayments
    }
}