using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace eLawyer.Models
{
    public class AdvocateModels
    {
        #region Client
        public static List<vw_ClientList> GetClients()
        {
            try
            {

                using (eLawyerEntities ve = new eLawyerEntities())
                {

                    // Client List 
                    return (from clients in ve.vw_ClientList
                            select clients).ToList();

                }
            }
            catch
            {
                return null;
            }
        }

        public static Clients GetClientById(int clientId)
        {
            try
            {

                using (eLawyerEntities ve = new eLawyerEntities())
                {
                    return ve.Clients.FirstOrDefault(cl => cl.Id == clientId);

                }
            }
            catch
            {
                return null;
            }
        }

        public static vw_ClientList GetClientDetailsById(int clientId)
        {
            try
            {

                using (eLawyerEntities ve = new eLawyerEntities())
                {
                    return ve.vw_ClientList.FirstOrDefault(cl => cl.Id == clientId);

                }
            }
            catch
            {
                return null;
            }
        }

        public static int CreateClient(Clients client)
        {

            try
            {
                using (eLawyerEntities ve = new eLawyerEntities())
                {
                    ve.AddToClients(client);
                    return ve.SaveChanges();
                }
            }
            catch (Exception)
            {
                return 0;
            }
        }

        public class ClientName
        {
            int _clientId;

            public int ClientId
            {
                get { return _clientId; }
                set { _clientId = value; }
            }
            string _name;

            public string Name
            {
                get { return _name; }
                set { _name = value; }
            }

        }

        public static SelectList GetClientNameList()
        {
            try
            {

                using (eLawyerEntities ve = new eLawyerEntities())
                {

                    // List of all clients
                    List<ClientName> clientList =
                   (from client in ve.Clients
                    select new ClientName { ClientId = client.Id, Name = client.Name }).ToList();
                    return new SelectList(clientList, "ClientId", "Name");

                }
            }
            catch
            {
                return null;
            }
        }


        public static int UpdateClient(int id, Clients client)
        {
            try
            {
                using (eLawyerEntities ve = new eLawyerEntities())
                {
                    Clients updated = ve.Clients.FirstOrDefault(cl => cl.Id == id);
                    if (updated != null)
                    {
                        updated.Name = client.Name;
                        updated.Lane = client.Lane;
                        updated.Street = client.Street;
                        updated.City = client.City;
                        updated.StateId = client.StateId;
                        updated.Zip = client.Zip;
                        updated.Phone1 = client.Phone1;
                        updated.Phone2 = client.Phone2;
                        updated.Cell = client.Cell;
                        updated.Email = client.Email;
                        updated.Website = client.Website;
                        updated.LastUpdated = DateTime.Now;
                        updated.Logo = client.Logo;
                        updated.ContentType = updated.ContentType;
                        updated.ContractStartDate = client.ContractStartDate;
                        updated.ContractEndDate = client.ContractEndDate;
                        return ve.SaveChanges();
                    }
                }
            }
            catch
            {
                return 0;
            }
            return 0;
        }
        #endregion


        

    }
}