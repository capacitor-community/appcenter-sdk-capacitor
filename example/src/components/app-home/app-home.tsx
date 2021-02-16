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
          <ion-title>AppCenter Capacitor</ion-title>
        </ion-toolbar>
      </ion-header>,

      <ion-content class="ion-padding">
        <ion-button href="/analytics" expand="block">Test Analytics</ion-button>
        <ion-button href="/crashes" expand="block">Test Crashes</ion-button>
        <ion-button href="/other" expand="block">Test Other APIs</ion-button>
      </ion-content>,

      <ion-footer>
        <ion-toolbar>
          <ion-title>appcenter-sdk-capacitor 0.0.1</ion-title>
        </ion-toolbar>
      </ion-footer>
    ];
  }
}
