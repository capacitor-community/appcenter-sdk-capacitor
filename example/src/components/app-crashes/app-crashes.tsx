import { Component, State, h } from '@stencil/core';
import { ToggleChangeEventDetail } from '@ionic/core';
import Crashes from '@capacitor-community/appcenter-crashes';

@Component({
  tag: 'app-crashes',
  styleUrl: 'app-crashes.css',
})
export class AppCrashes {
  /* Flag to toggle entire Crashes service */
  @State() enabled: boolean = false

  constructor() {
    this.toggleCrashes = this.toggleCrashes.bind(this);
    this.crashApp = this.crashApp.bind(this);
  }

  async componentWillLoad() {
    try {
      const { value: crashesEnabled } = await Crashes.isEnabled();

      this.enabled = crashesEnabled
    } catch (error) {
      console.error(error)
    }
  }

  async toggleCrashes(e: CustomEvent<ToggleChangeEventDetail>) {
    try {
      await Crashes.setEnabled({shouldEnable: e.detail.checked});
      this.enabled = e.detail.checked
    } catch (error) {
      this.enabled = false
      console.error(error)
    }
  }

  async crashApp() {
    try {
      await Crashes.generateTestCrash()
    } catch (error) {
      
    }
  }

  render() {
    return [
      <ion-header>
        <ion-toolbar color="primary">
          <ion-buttons slot="start">
            <ion-back-button defaultHref="/" />
          </ion-buttons>
          <ion-title>Crashes</ion-title>
        </ion-toolbar>
      </ion-header>,

      <ion-content class="ion-padding">
        <ion-list lines="full" class="ion-no-margin">
          <ion-item>
            <ion-label>Enable Analytics</ion-label>
            <ion-toggle checked={this.enabled} onIonChange={e => this.toggleCrashes(e)} />
          </ion-item>
        </ion-list>
        <br />
        <section>
          <header>Generate Test Crash</header>
          <ion-button color="danger" expand="block" onClick={this.crashApp}>Let app crash</ion-button>
        </section>
      </ion-content>,
    ];
  }
}
