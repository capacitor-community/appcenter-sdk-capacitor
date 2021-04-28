import { Component, State, h } from '@stencil/core';
import { ToggleChangeEventDetail } from '@ionic/core';
// import { Analytics } from '@capacitor-community/appcenter-analytics';

@Component({
  tag: 'app-analytics',
  styleUrl: 'app-analytics.css',
})
export class AppAnalytics {
  /* Flag to toggle entire Analytics service */
  @State() enabled: boolean = false
  /* Flag to pause/resume Analytics service */
  @State() paused: boolean = false;
  /* Custom Event fields */
  @State() eventName: string = "";
  @State() propertyName: string = "";
  @State() propertyValue: string = "";

  constructor() {
    this.toggleAnalytics = this.toggleAnalytics.bind(this);
    this.toggleLogs = this.toggleLogs.bind(this);
    this.trackEvent = this.trackEvent.bind(this);
  }

  async componentWillLoad() {
    try {
      // const analyticsEnabled = await Analytics.isEnabled();

      // this.enabled = analyticsEnabled.value;
    } catch (error) {
      console.error(error)
    }
  }

  async toggleAnalytics(e: CustomEvent<ToggleChangeEventDetail>) {
    // try {
    //   // resume logs before disabled analytics
    //   if(!e.detail.checked && this.paused) {
    //     await Analytics.resume();
    //     this.paused = false
    //   }

    //   await Analytics.enable({enableFlag: e.detail.checked});
    //   this.enabled = e.detail.checked
    // } catch (error) {
    //   this.enabled = false
    //   console.error(error)
    // }
  }

  async toggleLogs(e: CustomEvent<ToggleChangeEventDetail>) {
    // if(e.detail.checked) {
    //   try {
    //     await Analytics.pause();
    //     this.paused = e.detail.checked
    //   } catch (error) {
    //     this.paused = false
    //     console.error(error)
    //   }
    // } else {
    //   try {
    //     await Analytics.resume();
    //     this.paused = false
    //   } catch (error) {
    //     this.paused = true;
    //     console.error(error)
    //   }
    // }
  }

  async trackEvent() {
    // try {
    //   await Analytics.trackEvent({name: this.eventName, properties: {[this.propertyName]: this.propertyValue}});
    // } catch (error) {
    //   console.error(error)
    // }
  }

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
        <ion-list lines="full" class="ion-no-margin">
          <ion-item>
            <ion-label>Enable Analytics</ion-label>
            <ion-toggle checked={this.enabled} onIonChange={e => this.toggleAnalytics(e)} />
          </ion-item>
          <ion-item>
            <ion-label>Pause Analytics</ion-label>
            <ion-toggle disabled={!this.enabled} checked={this.paused} onIonChange={e => this.toggleLogs(e)}/>
          </ion-item>
          <ion-list-header lines="full">
            <ion-label>
              Custom Event
            </ion-label>
          </ion-list-header>
          <ion-item>
            <ion-label position="stacked">Name</ion-label>
            <ion-input disabled={!this.enabled} placeholder="video clicked" value={this.eventName} onIonChange={e => {this.eventName = e.detail.value}}></ion-input>
          </ion-item>
          <ion-item>
            <ion-label position="stacked">Property Name</ion-label>
            <ion-input disabled={!this.enabled} placeholder="category" value={this.propertyName} onIonChange={e => {this.propertyName = e.detail.value}}></ion-input>
          </ion-item>
          <ion-item>
            <ion-label position="stacked">Property Value</ion-label>
            <ion-input disabled={!this.enabled} placeholder="music" value={this.propertyValue} onIonChange={e => {this.propertyValue = e.detail.value}}></ion-input>
          </ion-item>
        </ion-list>
        <br/>
        <ion-button disabled={!this.enabled} onClick={this.trackEvent} expand="block">Track Event</ion-button>
      </ion-content>,

      <ion-footer>
        <ion-toolbar>
          <ion-title>Capacitor SDK 0.0.1</ion-title>
        </ion-toolbar>
      </ion-footer>
    ];
  }
}
