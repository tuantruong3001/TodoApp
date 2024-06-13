import { Injectable } from '@angular/core';
import { AngularFirestore } from '@angular/fire/compat/firestore';
import { Subscription,of } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class CustomerDataService {

  customers: any[] = [];
  subscription: Subscription | undefined;
  subscribeToCustomers() {
    if (!this.customers) {
      this.subscription = this.db.collection('customers').valueChanges({idField: 'id'})
      .subscribe(customers =>  {
        customers = customers;
      });
    }
  }

  getCustomer(id: string) {
    if (this.customers) {
      const cached = this.customers.find(v => v.id === id);
      console.log('use cached');
      return of(cached);
    } else {
      console.log('use db');
      return this.db.collection('customers').doc(id).valueChanges();
    }

  }

  dispose() {
  }

  constructor(private db: AngularFirestore) { }
}
