import { Component, h } from '@stencil/core';

@Component({
  tag: 'app-home',
  styleUrl: 'app-home.css',
})
export class AppHome {
  render() {
    return [
      <ion-header>
        <ion-toolbar color="primary">
          <ion-title>demo</ion-title>
        </ion-toolbar>
      </ion-header>,

      <ion-content class="ion-padding">
        <h3>AppCenter Capacitor SDK</h3>
        <p>Welcome! Tap on the links below to test various features of the Appcenter SDK</p>
        <ion-list lines="full" class="ion-no-margin">
          <ion-item href="/analytics">
            <ion-label>Analytics</ion-label>
          </ion-item>
          <ion-item href="/crashes">
            <ion-label>Crashes</ion-label>
          </ion-item>
          <ion-item href="/other">
            <ion-label>Core API's</ion-label>
          </ion-item>
        </ion-list>
      </ion-content>,
    ];
  }
}
