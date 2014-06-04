using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace eLawyer.Models
{
    public class MasterModels
    {
        //=====================================================================
        #region Ledgers
        public static int CreateLedger(EXPENSESHEAD ledger)
        {
            using (eLawyerEntities deo = new eLawyerEntities())
            {
                EXPENSESHEAD oldLedger = deo.EXPENSESHEAD.FirstOrDefault(exp => exp.ClientId == ledger.ClientId && ledger.CODE.Equals(exp.CODE, StringComparison.OrdinalIgnoreCase));
                if (oldLedger != null)
                    return 0;
                else
                {
                    if (ledger != null)
                    {
                        deo.AddToEXPENSESHEAD(ledger);
                        return deo.SaveChanges();
                    }
                }
            }
            return 0;
        }

        public static List<vw_ExpenseHeads> GetLedgerMasterList()
        {

            using (eLawyerEntities deo = new eLawyerEntities())
            {
                return (from ledger in deo.vw_ExpenseHeads
                        select ledger).OrderBy(ld => ld.LedgerType).ToList();
            }
        }

        public static List<vw_ExpenseHeads> GetLedgerMasterList(int clientId)
        {

            using (eLawyerEntities deo = new eLawyerEntities())
            {
                return (from ledger in deo.vw_ExpenseHeads
                        where ledger.ClientId == clientId
                        select ledger).OrderBy(ld => ld.LedgerType).ToList();
            }
        }
        public static EXPENSESHEAD GetLedgerDetailsByLedgerId(int expId)
        {
            using (eLawyerEntities deo = new eLawyerEntities())
            {
                return deo.EXPENSESHEAD.FirstOrDefault(exp => exp.Id == expId);
            }
        }

        public static int UpdateLedger(int ledgerId, EXPENSESHEAD newledger)
        {
            using (eLawyerEntities deo = new eLawyerEntities())
            {
                EXPENSESHEAD oldLedger = deo.EXPENSESHEAD.FirstOrDefault(exp => newledger.CODE.Equals(exp.CODE, StringComparison.OrdinalIgnoreCase));
                if (oldLedger != null)
                {
                    EXPENSESHEAD oldledger = deo.EXPENSESHEAD.FirstOrDefault(rk => rk.Id == ledgerId);
                    if (oldledger != null && newledger != null)
                    {
                        oldledger.CODE = newledger.CODE;
                        oldledger.NAME = newledger.NAME;
                        oldledger.LedgerTypeId = newledger.LedgerTypeId;
                        oldledger.OP_BAL = newledger.OP_BAL;
                        return deo.SaveChanges();
                    }
                }
                else
                    return 0;
            }
            return 0;
        }
        public static int DeleteLedgerByLedgerId(int id)
        {
            using (eLawyerEntities islObject = new eLawyerEntities())
            {
                Payments payment = islObject.Payments.FirstOrDefault(pmt => pmt.ExpenseHeadId == id);
                if (payment == null)
                {
                    EXPENSESHEAD ledger = islObject.EXPENSESHEAD.FirstOrDefault(rk => rk.Id == id);
                    if (ledger != null)
                    {
                        islObject.DeleteObject(ledger);
                        return islObject.SaveChanges();
                    }
                }
                return 0;
            }
        }
        #endregion//Ledger

        public static int CreatePayment(Payments payment)
        {
            using (eLawyerEntities deo = new eLawyerEntities())
            {
                if (payment != null)
                {
                    deo.AddToPayments(payment);
                    return deo.SaveChanges();
                }
            }
            return 0;
        }

        public static List<vw_PaymentLists> GetPaymentList(int clinetId, int paymentType, DateTime fromDate, DateTime DateTo)
        {
            using (eLawyerEntities deo = new eLawyerEntities())
            {
                return (from payment in deo.vw_PaymentLists
                        where payment.ClientId == clinetId && payment.LedgerTypeId == paymentType &&
                        payment.Date >= fromDate.Date &&
                        payment.Date <= DateTo.Date
                        select payment).ToList();
            }
        }

        public static List<vw_PaymentLists> GetPaymentList(int clinetId, int paymentType)
        {
            using (eLawyerEntities deo = new eLawyerEntities())
            {
                return (from payment in deo.vw_PaymentLists
                        where payment.ClientId == clinetId && payment.LedgerTypeId == paymentType
                        select payment).ToList();
            }
        }

    }
}