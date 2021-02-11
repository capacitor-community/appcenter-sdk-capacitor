import { Component, Prop, State, h } from '@stencil/core';
import { sayHello } from '../../helpers/utils';

@Component({
  tag: 'app-analytics',
  styleUrl: 'app-analytics.css',
})
export class AppAnalytics {
  @State() state = false;

  render() {
    return [
      <ion-header>
        <ion-toolbar color="primary">
          <ion-buttons slot="start">
            <ion-back-button defaultHref="/" />
          </ion-buttons>
          <ion-title>Analytics</ion-title>
        </ion-toolbar>
      </ion-header>,

      <ion-content class="ion-padding">
        <ion-item>
          <ion-label>Enable</ion-label>
          <ion-toggle checked={this.state} onIonChange={ev => (this.state = ev.detail.checked)} />
        </ion-item>

        <ion-button></ion-button>
      </ion-content>,

      <ion-footer>
        <ion-toolbar>
          <ion-title>Capacitor SDK 0.0.1</ion-title>
        </ion-toolbar>
      </ion-footer>
    ];
  }
}
