using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace eLawyer.Models
{
    public enum MessageType
    {
        None = 0,
        Success,
        Faild,
        Information,
        Error
    }

    public enum PaymentTypes
    {
        Expense = 1,
        Income
    }

    public class ApplicationMessages
    {
        public string MessageText;
        public MessageType Message_Type;
        public ApplicationMessages()
        {
            this.MessageText = string.Empty;
            this.Message_Type = 0;
        }

        public ApplicationMessages(string msgText, MessageType msgType)
        {
            this.MessageText = msgText;
            this.Message_Type = msgType;
        }

    }


    public class Utilities
    {
        public static int IndiaCountryCode = GetDefaultCountryCode(); //for India;

        public static int GetDefaultCountryCode()
        {
            using (eLawyerEntities islObject = new eLawyerEntities())
            {
                int defaultCountryCode = 0;
                defaultCountryCode = islObject.Countries.FirstOrDefault(cn => cn.Name == "India").Id;
                return defaultCountryCode;
            }
        }

        public class CountryNameList
        {
            int _countryId;
            public int CountryId
            {
                get { return _countryId; }
                set { _countryId = value; }
            }
            string _Name;

            public string Name
            {
                get { return _Name; }
                set { _Name = value; }
            }

        }

        public static SelectList GetCountryList()
        {
            try
            {

                using (eLawyerEntities islObject = new eLawyerEntities())
                {
                    // List of all coutries
                    List<CountryNameList> countryList =
                   (from country in islObject.Countries
                    select new CountryNameList { CountryId = country.Id, Name = country.Name }).ToList();
                    return new SelectList(countryList, "CountryId", "Name", IndiaCountryCode);

                }
            }
            catch
            {
                return null;
            }
        }


        public class StateNameList
        {
            int _stateId;

            public int StateId
            {
                get { return _stateId; }
                set { _stateId = value; }
            }
            string _name;

            public string Name
            {
                get { return _name; }
                set { _name = value; }
            }
        }

        public static SelectList GetStateList(int? countryId)
        {
            try
            {
                using (eLawyerEntities islObject = new eLawyerEntities())
                {
                    List<StateNameList> stateList = null;

                    if (countryId != null)
                    {
                        // List of States for given country
                        stateList =
                       (from state in islObject.States
                        where state.CountryId == countryId
                        select new StateNameList { StateId = state.Id, Name = state.Name }).ToList();
                        return new SelectList(stateList, "StateId", "Name");
                    }
                    else
                    {
                        // List of all States
                        stateList =
                       (from state in islObject.States
                        select new StateNameList { StateId = state.Id, Name = state.Name }).ToList();
                        return new SelectList(stateList, "StateId", "Name");
                    }
                }
            }
            catch
            {
                return null;
            }
        }

        public class GenderNameList
        {
            int _id;

            public int Id
            {
                get { return _id; }
                set { _id = value; }
            }

            string _genderName;

            public string GenderName
            {
                get { return _genderName; }
                set { _genderName = value; }
            }
        }

        public static SelectList GetGenderNameList()
        {
            try
            {
                using (eLawyerEntities islObject = new eLawyerEntities())
                {
                    List<GenderNameList> genderList = null;
                    // List of all States
                    genderList =
                   (from gender in islObject.Genders
                    select new GenderNameList { Id = gender.Id, GenderName = gender.Gender }).ToList();
                    return new SelectList(genderList, "Id", "GenderName");
                }
            }
            catch
            {
                return null;
            }
        }

        public static SelectList GetYesNoList()
        {
            try
            {
                using (eLawyerEntities islObject = new eLawyerEntities())
                {
                    List<SelectListItem> YesNoList = new List<SelectListItem>();

                    SelectListItem li = new SelectListItem();
                    li.Value = "True";
                    li.Text = "Yes";
                    YesNoList.Add(li);

                    SelectListItem li2 = new SelectListItem();
                    li2.Value = "False";
                    li2.Text = "No";
                    YesNoList.Add(li2);

                    return new SelectList(YesNoList, "Value", "Text");

                }
            }
            catch
            {
                return null;
            }
        }

        public class PaymentModeNames
        {
            int _id;

            public int Id
            {
                get { return _id; }
                set { _id = value; }
            }
            string _name;

            public string Name
            {
                get { return _name; }
                set { _name = value; }
            }
        }

        public static SelectList GetPaymentModesNameList()
        {
            try
            {
                using (eLawyerEntities islObject = new eLawyerEntities())
                {
                    // List of all Batchs
                    List<PaymentModeNames> modeList =
                   (from mode in islObject.PaymentModes
                    select new PaymentModeNames { Id = mode.Id, Name = mode.Mode }).ToList();
                    return new SelectList(modeList, "Id", "Name");

                }
            }
            catch
            {
                return null;
            }
        }

        public class PaymentHeadNames
        {
            int _id;

            public int Id
            {
                get { return _id; }
                set { _id = value; }
            }
            string _name;

            public string Name
            {
                get { return _name; }
                set { _name = value; }
            }
        }

        public static SelectList GetPaymentHeadsNameList()
        {
            try
            {
                using (eLawyerEntities islObject = new eLawyerEntities())
                {
                    // List of all Batchs
                    List<PaymentHeadNames> headList =
                   (from head in islObject.PaymentHeads
                    select new PaymentHeadNames { Id = head.Id, Name = head.PaymentHead }).ToList();
                    return new SelectList(headList, "Id", "Name");

                }
            }
            catch
            {
                return null;
            }
        }

        public class ExpenseHeadNameList
        {
            int expenseHeadId;

            public int ExpenseHeadId
            {
                get { return expenseHeadId; }
                set { expenseHeadId = value; }
            }


            string _ac_Name;

            public string Ac_Name
            {
                get { return _ac_Name; }
                set { _ac_Name = value; }
            }
        }

        /// <summary>
        /// expenseType=1 for Expense and 2=Income
        /// </summary>
        /// <param name="expenseType"></param>
        /// <returns></returns>
        public static SelectList GetExpenseHeadNameList(int clientId, int paymentType)
        {
            try
            {
                using (eLawyerEntities islObject = new eLawyerEntities())
                {
                    List<ExpenseHeadNameList> expenseHeadList = null;
                    // List of all Ledgers(ExpenseHeads)
                    expenseHeadList =
                   (from expenseHead in islObject.EXPENSESHEAD
                    where expenseHead.LedgerTypeId == paymentType && expenseHead.ClientId == clientId
                    select new ExpenseHeadNameList { ExpenseHeadId = expenseHead.Id, Ac_Name = expenseHead.NAME }).ToList();
                    return new SelectList(expenseHeadList, "ExpenseHeadId", "AC_Name");

                }
            }
            catch
            {
                return null;
            }
        }

        public class LedgerTypeNameList
        {
            int _id;

            public int Id
            {
                get { return _id; }
                set { _id = value; }
            }

            string _type;

            public string Type
            {
                get { return _type; }
                set { _type = value; }
            }

        }

        public static SelectList GetLedgerNameList(int selectedId = 0)
        {
            try
            {
                using (eLawyerEntities islObject = new eLawyerEntities())
                {
                    List<LedgerTypeNameList> ledgerTypeList = null;
                    // List of all LegderTypes
                    ledgerTypeList =
                   (from ledgerType in islObject.LedgerTypes
                    select new LedgerTypeNameList { Id = ledgerType.Id, Type = ledgerType.Type }).ToList();
                    return new SelectList(ledgerTypeList, "Id", "Type", selectedId);
                }
            }
            catch
            {
                return null;
            }
        }

        public class CaseNatureNameList
        {
            int _id;

            public int Id
            {
                get { return _id; }
                set { _id = value; }
            }

            string _nature;

            public string Nature
            {
                get { return _nature; }
                set { _nature = value; }
            }

        }


        public static SelectList GetCaseNatureNameList(int selectedId = 0)
        {
            try
            {
                using (eLawyerEntities islObject = new eLawyerEntities())
                {
                    List<CaseNatureNameList> caseNatureList = new List<CaseNatureNameList>();
                    // List of all LegderTypes
                    caseNatureList = (from caseNature in islObject.CaseNatures
                                      select new CaseNatureNameList { Id = caseNature.Id, Nature = caseNature.Nature }).ToList();
                    return new SelectList(caseNatureList, "Id", "Nature", selectedId);
                }
            }
            catch
            {
                return null;
            }
        }

    }
}