import { Component, h, State } from '@stencil/core';
// import { AppCenter } from '@capacitor-community/appcenter-shared';

@Component({
  tag: 'app-other',
  styleUrl: 'app-other.css',
})
export class AppOther {
  /* App Center UUID */
  installId: String = 'unknown'
  /* App Center SDK Version */
  sdkVersion: String = 'unknown'
  /* App Center userId */
  @State() userId: string;
  /* Flag to toggle App Center SDK */
  @State() enabled: boolean = false

  constructor() {
    this.updateUserId = this.updateUserId.bind(this);
    this.toggleSdk = this.toggleSdk.bind(this);
  }

  async componentWillLoad() {
    try {
      // const sdkEnabled = await AppCenter.isEnabled()
      // const installId = await AppCenter.getInstallId()
      // const sdkVersion = await AppCenter.getSdkVersion()

      // this.installId = installId.value
      // this.sdkVersion = sdkVersion.value
      // this.enabled = sdkEnabled.value
    } catch (error) {
      console.error(error)
    }
  }

  async updateUserId(e: CustomEvent) {
    this.userId = e.detail.value

    try {
      // await AppCenter.setUserId({userId: this.userId})
    } catch (error) {
      console.error(error)
    }
  }

  async toggleSdk(e: CustomEvent) {
    try {
      // await AppCenter.enable({enableFlag: e.detail.checked});
      this.enabled = e.detail.checked
    } catch (error) {
      this.enabled = false
      console.error(error)
    }
  }

  render() {
    return [
      <ion-header>
        <ion-toolbar color="primary">
          <ion-buttons slot="start">
            <ion-back-button defaultHref="/" />
          </ion-buttons>
          <ion-title>Other APIs</ion-title>
        </ion-toolbar>
      </ion-header>,

      <ion-content class="ion-padding">
        {/* <ion-button expand="block">Set Custom Property</ion-button> */}
        <ion-list lines="full" class="ion-no-margin">
          <ion-item>
            <ion-label>Enable All App Center Services</ion-label>
            <ion-toggle checked={this.enabled} onIonChange={(event) => this.toggleSdk(event)} />
          </ion-item>
          <ion-item>
            <ion-label>App Center SDk</ion-label>
            <ion-note slot="end">{this.sdkVersion}</ion-note>
          </ion-item>
          <ion-item>
            <ion-label>User ID</ion-label>
            <ion-input slot="end" onIonChange={event => this.updateUserId(event)} placeholder="type-user-id-here" type="text" value={this.userId}></ion-input>
          </ion-item>
          <ion-item>
            <ion-label>
              <h2>Install ID</h2>
              <p>{this.installId}</p>
            </ion-label>
          </ion-item>
        </ion-list>
      </ion-content>,
    ];
  }

}